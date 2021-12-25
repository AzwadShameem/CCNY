#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include "sem.h"	
#define CHILD      			0  			/* Return value of child proc from fork call */
#define TRUE       			0
#define FALSE      			1

FILE *fp1, *fp2, *fp3, *fp4, *fp5, *fp6, *fp7;      /* File Pointers - extra fp5-7 for wait counter */
int semaphore;								        /* Semaphore */

int main()
{
    int pid;						// Process ID after fork call
    int i;							// Loop index
    int N;							// Number of times dad does update
    int N_Att;						// Number of time sons allowed to do update
    int status;						// Exit status of child process
    int bal1, bal2;					// Balance read by processes
    int flag, flag1;				// End of loop variables
    int dad, son_1, son_2;			// Counter for wait time

    // Semaphore creation 
    if ((semaphore=semget(IPC_PRIVATE, 1, 0666 | IPC_CREAT)) == -1) { 
        // If semaphore failed to get created in semget()
        perror("Error in semget(). ");
        exit(-1);
    } else {
        sem_create(semaphore,1);
    }

    //Initialize the file balance to be $100
    fp1 = fopen("balance","w");
    bal1 = 100;
    fprintf(fp1, "%d\n", bal1);
    fclose(fp1);

    //Initialize the number of attempts to be 20
    fp4 = fopen("attempt", "w");
    N_Att = 20;
    fprintf(fp4, "%d\n", N_Att);
    fclose(fp4);

    // Initialize dad process counter for wait time
    fp5 = fopen("dad", "w");	
    fprintf(fp5, "%d\n", (dad = 0));
    fclose(fp5);

    // Initialize son 1 process counter for wait time
    fp6 = fopen("son_1", "w");		
    fprintf(fp6, "%d\n", (son_1 = 0));
    fclose(fp6);

    // Initialize son 2 process counter for wait time
    fp7 = fopen("son_2", "w");	
    fprintf(fp7, "%d\n", (son_2 = 0));
    fclose(fp7);


    // Create child processes that will do the updates
    if ((pid = fork()) == -1) {
        //fork failed!
        perror("fork");
        exit(-1);
    }  

    if (pid == CHILD){
        //First Child Process. Dear old dad tries to do some updates.

        N=5;
        for(i=1;i<=N; i++)
        {
            P(semaphore); // Dad process is entering it's critical section

            // Since dad process has entered critical section, son 1 & 2 are waiting
            fp6 = fopen("son_1","r+");
            fp7 = fopen("son_2","r+");
            fscanf(fp6, "%d", &son_1);
            fscanf(fp7, "%d", &son_2);
            fseek(fp6, 0L, 0);
            fseek(fp7, 0L, 0);
            fprintf(fp6, "%d\n", ++son_1); // therefore, we increment son 1's wait counter
            fprintf(fp7, "%d\n", ++son_2); // therefore, we increment son 2's wait counter
            fclose(fp6);
            fclose(fp7);

            printf("Dear old dad is trying to do update.\n");
            fp1 = fopen("balance", "r+");
            fscanf(fp1, "%d", &bal2);
            printf("Dear old dad reads balance = %d \n", bal2);

            //Dad has to think (0-14 sec) if his son is really worth it
            sleep(rand()%1);
            fseek(fp1,0L,0);
            bal2 += 60;
            printf("Dear old dad writes new balance = %d \n", bal2);
            fprintf(fp1, "%d \n", bal2);
            fclose(fp1);

            printf("Dear old dad is done doing update. \n");
            sleep(rand()%5);	/* Go have coffee for 0-4 sec. */

            V(semaphore); // Dad process is exiting it's critical section
        }
    }

    else
    {
        //Parent Process. Fork off another child process.
        if ((pid = fork()) == -1)
        {
            //Fork failed!
            perror("fork");
            exit(1);
        }
        if (pid == CHILD)
        {
            printf("First Son's Pid: %d\n",getpid());
            //Second child process. First poor son tries to do updates.
            flag = FALSE;
            while(flag == FALSE)
            {
                P(semaphore); // Son 1 process is entering it's critical state

                // Since Son 1 process has entered critical section, dad & son 2 are waiting
                fp5 = fopen("dad","r+");
                fp7 = fopen("son_2","r+");
                fscanf(fp5,"%d",&dad);
                fscanf(fp7,"%d",&son_2);
                fseek(fp5, 0L, 0);
                fseek(fp7, 0L, 0);
                fprintf(fp5, "%d\n", ++dad);    // therefore, we increment dad's wait counter
                fprintf(fp7, "%d\n", ++son_2);  // therefore, we increment son 2's wait counter
                fclose(fp5);
                fclose(fp7);

                fp3 = fopen("attempt" , "r+");
                fscanf(fp3, "%d", &N_Att);
                if(N_Att == 0)
                {
                    fclose(fp3);
                    flag = TRUE;
                }
                else
                {
                    printf("Poor SON_1 wants to withdraw money.\n");
                    fp2 = fopen("balance", "r+");
                    fscanf(fp2,"%d", &bal2);
                    printf("Poor SON_1 reads balance. Available Balance: %d \n", bal2);
                    if (bal2 == 0)
                    {
                        fclose(fp2);
                        fclose(fp3);
                    }
                    else
                    {
                        sleep(rand()%5);
                        fseek(fp2,0L, 0);
                        bal2 -=20;
                        printf("Poor SON_1 write new balance: %d \n", bal2);
                        fprintf(fp2,"%d\n", bal2);
                        fclose(fp2);
                        printf("poor SON_1 done doing update.\n");
                        fseek(fp3,0L, 0);
                        N_Att -=1;
                        fprintf(fp3, "%d\n", N_Att);
                        fclose(fp3);
                    }
                }

                V(semaphore); // Son 1 is exiting it's critical section

            }
        }
        else
        {
            //Parent Process. Fork off one more child process.
            if ((pid = fork()) == -1)
            {
                //fork failed!
                perror("fork");
                exit(1);
            }
            if (pid == CHILD)
            {
                printf("Second Son's Pid: %d\n",getpid());
                //Third child process. Second poor son tries to do updates.
                flag1 = FALSE;
                while(flag1 == FALSE)
                {
                    P(semaphore); // Son 2 is entering it's critical section 

                    // Since Son 2 process has entered critical section, dad & son 1 are waiting
                    fp5 = fopen("dad","r+");
                    fp6 = fopen("son_1","r+");
                    fscanf(fp5, "%d", &dad);
                    fscanf(fp6, "%d", &son_1);
                    fseek(fp5, 0L, 0);
                    fseek(fp6, 0L, 0);
                    fprintf(fp5, "%d\n", ++dad);   // therefore, we increment dad's wait counter
                    fprintf(fp6, "%d\n", ++son_1); // therefore, we increment son 1's wait counter
                    fclose(fp5);
                    fclose(fp6);

                    fp3 = fopen("attempt" , "r+");
                    fscanf(fp3, "%d", &N_Att);
                    if(N_Att == 0)
                    {
                        fclose(fp3);
                        flag1 = TRUE;
                    }
                    else
                    {
                        printf("Poor SON_2 wants to withdraw money.\n");
                        fp2 = fopen("balance", "r+");
                        fscanf(fp2,"%d", &bal2);
                        printf("Poor SON_2 reads balance. Available Balance: %d \n", bal2);
                        if (bal2 == 0)
                        {
                            fclose(fp2);
                            fclose(fp3);
                        }
                        else
                        {
                            sleep(rand()%5);
                            fseek(fp2,0L, 0);
                            bal2 -=20;
                            printf("Poor SON_2 write new balance: %d \n", bal2);
                            fprintf(fp2,"%d\n", bal2);
                            fclose(fp2);

                            printf("poor SON_2 done doing update.\n");
                            fseek(fp3,0L, 0);
                            N_Att -=1;
                            fprintf(fp3, "%d\n", N_Att);
                            fclose(fp3);
                        }
                    }

                    V(semaphore); // Son 2 has exited it's critical section
                }
            }
            else
            {
                // Wait for Dad, Son 1, Son 2 processes to finish
                pid = wait(&status);
                printf("Process(pid = %d) exited with the status %d. \n", pid, status);
                fp5 = fopen("dad", "r");
                fscanf(fp5, "%d", &dad);
                fclose(fp5);

                pid = wait(&status);
                printf("Process(pid = %d) exited with the status %d. \n", pid, status);
                fp6 = fopen("son_1", "r");
                fscanf(fp6,"%d", &son_1);
                fclose(fp6); 

                pid = wait(&status);
                printf("Process(pid = %d) exited with the status %d. \n", pid, status);
                fp7 = fopen("son_2", "r");
                fscanf(fp7,"%d", &son_2);
                fclose(fp7); 

                // Print out the wait times 
                printf("\nDad waited %d times\n", dad);
                printf("Son 1 waited %d times\n", son_1);
                printf("Son 2 waited %d times\n", son_2);

                // Remove the files that I made to as a counter
                remove("dad");
                remove("son_1");
                remove("son_2");

                semkill(semaphore); // Remove the semaphore because it is not needed anymore
            }
            return 0;
        }
        return 0;
    }
    exit(0);
}