#!/usr/bin/env python3
import random
import array

print("Welcome to rock, paper, scissors! \n You can type 'q' at any time to quit, or you can play for best out of 20 rounds.")
user_score = 0
cpu_score = 0
exit_status = 0
round_count = 0
draw_count = 0

while round_count < 20 and exit_status == 0:

    print("ROCK, PAPER, SCISSORS...SHOOT! (Please choose rock, paper, scissors, or Q to quit.) \n YOU:", user_score, "\n CPU:", cpu_score, "\n DRAW:", draw_count,)
    user_input = input("\n Enter answer: ")

    rnum = random.randint(0, 2)
    game_array = ["rock", "paper", "scissors"]
    computer_input = game_array[rnum]

    if user_input.lower() == "q":
        exit_status = 2

    elif user_input.lower() == "rock" and computer_input.lower() == "scissors" or user_input.lower() == "scissors" and computer_input.lower() == "paper" or user_input.lower() == "paper" and computer_input.lower() == "rock":
        print("You WIN!", user_input.lower(), "beats", computer_input.lower())
        user_score +=1
        round_count += 1

    elif computer_input.lower() == "rock" and user_input.lower() == "scissors" or computer_input.lower() == "scissors" and user_input.lower() == "paper" or computer_input.lower() == "paper" and user_input.lower() == "rock":
        print("You lost this round...", computer_input.lower(), "beats", user_input.lower())
        cpu_score += 1
        round_count += 1

    elif user_input.lower() == computer_input.lower():
        print("You both chose", user_input, ". This round is a draw")
        draw_count += 1
        round_count += 1

    else:
        print("ERROR! Please enter rock, paper, or scissors")

print("\n \n################################ SCORE PAGE ################################")
print("Thanks for playing!")
if exit_status == 2:
    print("Quitting the game... \n YOU:", user_score, "\n CPU:", cpu_score, "\n DRAW:", draw_count,)
elif user_score > cpu_score:
    print("You won!! =) Here is the final score... \n YOU:", user_score, "\n CPU:", cpu_score, "\n DRAW:", draw_count,)
elif cpu_score > user_score:
    print("You lost!! >=( Here is the final score... \n YOU:", user_score, "\n CPU:", cpu_score, "\n DRAW:", draw_count,)
elif cpu_score == user_score:
    print("It's a DRAW!! =/ Here is the final score... \n YOU:", user_score, "\n CPU:", cpu_score, "\n DRAW:", draw_count,)
quit()
