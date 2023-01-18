#!/usr/bin/env python3

import random

## random.randint does the same thing but includes the stop number. randrange does not include the stop number.
print("Welcome to the number guessing game!")
num = 0 # variable representing the user-chosen number
exit_status = 0 # used to track the quit option and to break the while loop.
print(" Please choose a number greater than or equal to 10. This will be the range of numbers that you would like to guess from. \n EXAMPLE: if you choose 10 then the random number will be between 0 and 10. If you type 100 then the random number will be selected from 0-100. \n You may type 'quit' at any time to end the game and quit.")
while exit_status == 0:
    num = input("Enter your number here: ")
    if num.lower() == "quit": # Checking if user wants to quit
        exit_status = 2
    elif num.isdigit(): # If the number is a digit, turn the str into an int
        num = int(num)
        if num < 10: # Making sure that the number is greater than or equal to 10
            print("please enter a number that is greater than or equal to 10")
        else:
            exit_status = 1
            print("The number you have chosen is " + str(num))
    elif not num.isdigit() and not num == "quit":
        print("please enter a number to continue")

if exit_status == 2:
    print("Thank you for playing! Quitting the game...")
    quit()

exit_status = 0

print("I have chosen a random number between 0-" + str(num) + ". Start guessing...")

rnum = random.randint(0, num)
gnum = -1
## Guess template
## While gussed number is not equal to the random number and while exit_status = 0, the loop will continue
n = 0 #Number of tries
while gnum != rnum and exit_status == 0:
    n += 1
    gnum = input("This is guess # " + str(n) + ": ")

    ## If it is not a valid entry...
    if not gnum.isdigit() and not gnum == "quit":
        print("please enter a number")

    ## If the user wants to quit
    if gnum.lower() == "quit":
        exit_status = 2

    if gnum.isdigit():
        gnum = int(gnum)
        if gnum == rnum and n == 1:
            print("You guessed it! The random number is " + str(rnum) + "! and it only took you " + str(n) + " try. Thanks for playing! Exiting...")
        elif gnum == rnum and n > 1:
            print("You guessed it! The random number is " + str(rnum) + "! and it only took you " + str(n) + " tries. Thanks for playing! Exiting...")
        elif gnum > rnum:
            print("Go Down")
        elif gnum < rnum:
            print("Go Up")

if exit_status == 2:
    print("Thank you for playing! Quitting the game...")
    quit()
