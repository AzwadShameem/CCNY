import random


# Question 1
#########################################################################################
# Submission was zipped with the files binary1.txt and binary2.txt
# Input is the files binary1.txt and binary2.txt
# Output should be 68% similar for the given files
def count_similarity(f1, f2):
    file1_lines = f1.read().splitlines()
    file2_lines = f2.read().splitlines()
    file1_length = file2_length = 0
    # find out the length of the files and use the higher one
    for i in file1_lines:
        file1_length += len(i)
    for i in file2_lines:
        file2_length += len(i)
    if file1_length >= file2_length:
        length = file1_length
    else:
        length = file2_length

    # Here we check for each line, each character if they are the same the increment count
    count = 0
    for file1_string, file2_string in zip(file1_lines, file2_lines):
        for file1_character, file2_character in zip(file1_string, file2_string):
            if file1_character == file2_character:
                count += 1
    return int(count / length * 100)  # returns an percentage of how similarity between the files


print("Question 1>")
with open("binary1.txt", "r") as file1, open("binary2.txt", "r") as file2:
    print("These files are %d" % count_similarity(file1, file2) + "% similar.\n")


# Question 2
########################################################################
# Submission was zipped with Julius Caesar.txt example from the question
# Input is the Julius Caesar.txt and a integer n
# Output should be shown in Julius Caesar.txt, with n words swapped
def switcher(filename, n):
    with open(filename, "r+") as files:
        lines = files.readlines()  # lines is now a list of lines
        print("The original string is: " + str(lines))
        second_line = lines[1].split()  # second_line is a list of words in the 2nd line
        last_line = lines[-1].split()  # last_line is a list of words in the last line

        front = second_line[:n]  # save the front of second line
        end = last_line[-n:]  # save the end of the last line
        second_line[:n] = end  # put the end of the last line to the front of the second line
        last_line[-n:] = front  # put the front of second line at end of the last line

        lines[1] = ''  # second line is now empty
        for i in second_line:
            lines[1] += i + " "  # put each word in with a space after it
        lines[1] += "\n"

        lines[-1] = ''  # last line is now empty
        for i in last_line:
            lines[-1] += i + " "  # put each word in with a space after it

        files.seek(0)  # point to start of the file to overwrite
        files.writelines(lines)  # write the edited string of the file back to the file
        print("The switched string is: " + str(lines) +
              "\nThe string with front of second line and end of last line switched is written to Julius Caesar.txt")


print("Question 2>")
user_input = int(input('Please enter the number of words you wish to switch: '))
switcher("Julius Caesar.txt", user_input)


# Question 3
#############################################################
# The function to_2d_list takes a 1d list and makes it into
# A 2d list with 2 elements of the 1d list per element of the 2d list
def to_2d_list(list_i):
    list2d_I = []
    for i in range(len(list_i) - 1):
        list2d_I.append([list_i[i], list_i[i + 1]])
    # Adds strangling elements if list is not even
    if len(list_i) % 2 != 0:
        list2d_I.append([list_i[len(list_i) - 1]])
    return list2d_I

# The function projection just projects a 2d list onto a list
def projection(list2d_i, list_j):
    proj = []
    for i in list_j:
        proj.append(list2d_i[i])
    return proj


I = [1, 2.09, 3, 4, 5, 6, 'a', 8, 9, 10.14, 11, 'b']
J = [1, 2, 7]
print("\nQuestion 3>")
print(to_2d_list(I))
print(projection(to_2d_list(I), J))


# Question 4
#############################################################
# Submission was zipped with 2D.txt
# Input is 2D.txt and the a 2d list read from 2D.TXT
# Output should be written in 2D.txt and printed to terminal
# Output will have the 2d list shuffled
def shuffle_list2d(list2d, filename):
    file.seek(0)
    print("\nShuffled Matrix")
    random.shuffle(list2d)  # Shuffles the rows of the 2d list
    for i in range(len(list2d)):
        random.shuffle(list2d[i])  # Shuffles the columns of the 2d list
        for j in range(len(list2d[i])):
            if list2d[i][j] != '\n':
                print(list2d[i][j], file=filename)  # Writes shuffled 2d list to file
                print(list2d[i][j], end="\t")  # Writes shuffled 2d list to terminal
        print()


print("\nQuestion 4>")
with open("2D.txt", "r+") as file:
    file_string = file.read().splitlines()
    rows = int(len(file_string) ** .5)  # calculates rows for the 2d list
    columns = rows + 1  # calculates columns for the 2d list
    list_2d = [['\n' for i in range(columns)] for j in range(rows)]
    current = 0
    for i in range(0, rows):
        for j in range(0, columns):
            list_2d[i][j] = file_string[current]
            current += 1

    print("Original Matrix")
    for i in range(rows):
        for j in range(columns):
            print(list_2d[i][j], end="\t")
        print()

    shuffle_list2d(list_2d, file)

# Question 5
#############################################################
print("\nQuestion 5>")
# Prints out the desired statement in one print
print("*" + "\n" +
      "*" + "\n" +
      "****" + "\n" +
      "***" + "\n" +
      "******" + "\n" +
      "*****" + "\n" +
      "********" + "\n" +
      "*******" + "\n" +
      "**********" + "\n")

# Question 6
#############################################################
print("Question 6>")
# prints out the desired statement in one print
print("*" + "\n" +
      "**" + "\n" +
      "***" + "\n" +
      "***" + "\n" +
      "****" + "\n" +
      "*****" + "\n" +
      "****" + "\n" +
      "*****" + "\n" +
      "******" + "\n" +
      "*******" + "\n" +
      "*****" + "\n" +
      "******" + "\n" +
      "*******" + "\n" +
      "********" + "\n" +
      "*********" + "\n")


# Question 7
#############################################################
# Submission was zipped with caesar_shift_input.txt
# Input is caesar_shift_input.txt and a user input integer, n
# Output is in the written file and printed to terminal
# Works with the example in the pdf
# Inputs - ’aaaaabbbcc’, n = 2
# Outputs - cccccdddee
def caesar_shifter(filename, n):
    f_string = filename.read()
    print("Printing the original string: " + f_string)
    with open("caesar_shift.txt", "w") as output:
        result = ''
        for i in f_string:
            if i.isalpha():
                if i.islower():
                    start = ord("a")
                    output.write(chr((ord(i) - start + n) % 26 + start))
                    result += chr((ord(i) - start + n) % 26 + start)
                else:
                    ord("A")
            else:
                output.write(i)
                result += i
    print("Result: " + result + "\nThis result has been written to ceasar_shift.txt")


print("Question 7>")
with open("caesar_shift_input.txt", "r+") as f:
    caesar_shifter(f, 2)  # Example given from test -----  file_string = ’aaaaabbbcc’, n = 2
    # This does in fact print out cccccdddee to the file


# Question 8
#############################################################
# Inputs - takes two user strings, original string and one prefix
# Output - returns a sorted and reversed version with all the prefixes in the original string
# Example input/output
# input - prefix, pre
# output - (['p', 'pr', 'pre'], ['pre', 'pr', 'p'])
# ['p', 'pr', 'pre'] - sorted / ['pre', 'pr', 'p'] - reversed
def prefix_exists(string_x, string_y):
    prefix = set()
    for i in range(1, len(string_x)):
        if string_x[:i] in string_y:
            prefix.add(string_x[:i])
    return sorted(prefix), sorted(prefix, reverse=True)


print("\nQuestion 8>")
stringX = (str(input("Please enter the string: ")))
stringY = (str(input("Please enter the prefix: ")))
print(prefix_exists(stringX, stringY))
