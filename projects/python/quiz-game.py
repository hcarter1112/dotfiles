#!/usr/bin/env python3

## Welcome message
print("Welcome to the POP QUIZ!")

## Confirmation that the user wants to play the quiz
playing = input("Do you want to play? ")

if playing.lower() != "yes":
    print("You did not enter 'yes'. >=-(")
    quit()

## Establish a score to track during the quiz. The idea is that the user will get a score as they go through the quiz
score = 0

print("OK! Let's play! When you get a question correct, we will add one point to your score. To start your score is " + str(score))

## Question 1
answer = input("What does CPU stand for? ")

if answer.lower() == "central processing unit":
    score = (score +1)
    print("Correct! Your score is " + str(score))
else:
    print("Incorrect =(")

## Question 2
answer = input("What does RAM stand for? ")

if answer.lower() == "random access memory":
    score = (score +1)
    print("Correct! Your score is " + str(score))
else:
    print("Incorrect =(")

## Question 3
answer = input("How many gigabytes are in a terabyte? ")

if answer.lower() == "1000":
    score = (score +1)
    print("Correct! Your score is " + str(score))
else:
    print("Incorrect =(")

## Question 4
answer = input("What does GPU stand for? ")

if answer.lower() == "graphics processing unit":
    score = (score +1)
    print("Correct! Your score is " + str(score))
else:
    print("Incorrect =(")

print("This is the FINAL QUESTION...")
## Question 5
answer = input("What is the color of the sky? ")

if answer.lower() == "blue":
    score = (score +1)
    print("Correct!")
else:
    print("Incorrect =(")

if score >= 4:
    print("Nice work!")
elif score == 3:
    print("meh...")
else:
    print("FAILURE!! please try again!")

print("Your FINAL score is " + str(score) + "/5. That is " + str((score / 5) * 100) + "%. Thank you for playing!")
