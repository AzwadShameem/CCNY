#include <unordered_map>
#include <queue>
#include <climits>
using namespace std;

#define k 10
int maximumFlow(int n, const int *cap, int *flow, int *residual);

int main()
{    int capacities[4*k+2][4*k+2];
    int flow[4*k+2][4*k+2];
    int residual[4*k+2][4*k+2];
    int i,j, improvement, stepCount, totalFlow;
    int inflow, outflow;
    for(i=0; i<4*k+2; i++)
        for(j=0; j<4*k+2; j++)
        {  capacities[i][j]=0; flow[i][j]=0; residual[i][j]=0;
        }
    /* initialize capacities */
    for(i=1; i< k+1; i++)
    { capacities[0][i] = 20;
        capacities[i][k+i] = 4;
        capacities[i][k+(i%k)+1] = 4;
        capacities[i][2*k+i] = 5;
        capacities[k+i][3*k+i] = 5;
        capacities[2*k+i][3*k+i] = 3;
        capacities[2*k+i][3*k+(i%k)+1] = 3;
        capacities[2*k+i][3*k+((i+1)%k)+1] = 3;
        capacities[3*k+i][4*k+1] = 12;
    }
    printf("created capacity matrix. %d vertices, expected maximum flow %d.\n",
           4*k+2, 10*k );
    improvement=1; stepCount = 0;
    while( improvement > 0)
    { improvement= maximumFlow(4 * k + 2, &(capacities[0][0]), &(flow[0][0]),
                               &(residual[0][0]));
        stepCount ++;
        /* check flow matrix: capacity constraint and non-negativity */
        for(i=0; i<4*k+2; i++)
            for(j=0; j<4*k+2; j++)
            {  if( flow[i][j] < 0 )
                {	printf("step %d: negative flow value %d on edge %d -> %d\n",
                            stepCount, flow[i][j], i, j); fflush(stdout); exit(0);
                }
                if( flow[i][j] > capacities[i][j] )
                {	printf("step %d: flow %d > capacity %d on edge %d -> %d\n",
                            stepCount, flow[i][j], capacities[i][j], i, j);
                    fflush(stdout); exit(0);
                }
            }
        /* check flow matrix: inflow = outflow */
        for( i=1; i< 4*k+1; i++ )
        {  inflow = 0; outflow = 0;
            for( j=0; j<4*k+2; j++ )
            {  inflow += flow[j][i];
                outflow += flow[i][j];
            }
            if( inflow != outflow )
            {  printf("step %d: flow conservation violated in vertex %d\n",
                      stepCount, i); fflush(stdout); exit(0);
            }
        }
        printf("step %d completed; improvement %d\n", stepCount, improvement );
    }
    totalFlow =0;
    for( i=1; i<k+1; i++)
        totalFlow += flow[0][i];
    printf("finished after %d steps; total flow %d\n", stepCount, totalFlow);
}

int maximumFlow(int n, const int *cap, int *flow, int *residual) {

    // Edits residual graph to traverse through //
    for (int i = 0;i < n;i++) {
        for (int j = 0;j < n;j++) {
            residual[i*n+j] = (cap[i*n+j] - flow[i*n+j]);
        }
    }

    // BFS //
    unordered_map<int, int> path;
    bool visited[4*k+2][4*k+2]= {false};
    queue<int> list;
    list.push(0);
    while (!list.empty()) {
        int i = list.front();
        list.pop();
        for (int j = 0;j < n;j++) {
            if (!visited[i][j] && residual[i*n+j] > 0) {
                visited[i][j] = true;
                list.push(j);
                path[j] = i;
            }
        }
    }
    // END OF BFS //

    // Traverse to find the bottleneck //
    int end = n-1; int bottleneck = INT_MAX;
    while (end != 0) {
        bottleneck = min(bottleneck, residual[path[end]*n+end]);
        end = path[end];
    }
    // Traverse and edit flow graph //
    end = n-1;
    while (end != 0) {
        flow[path[end]*n+end] += bottleneck;
        end = path[end];
    }
    return bottleneck;
}