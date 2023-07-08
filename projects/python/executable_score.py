#!/usr/bin/env python3

def main():
    # Recieve the score of the user
    score = int(input("Score: "))
    grade_test(score)

    # Grade the score
def grade_test(score):
    match score:
        case range(90, 1000):
            print(f"Your score is {score}% - A")
        case range(80, 91):
            print(f"Your score is {score}% - B")
        case range(70, 81):
            print(f"Your score is {score}% - C")
        case range(60, 71):
            print(f"Your score is {score}% - D")
        case _:
            print(f"Your score is {score}% - F")

    # grade_rng = {
    #     90: "A",
    #     80: "B",
    #     70: "C",
    #     60: "D",
    #     0: "F",
    # }

    # grade_num = list(grade_rng.keys())
    # while score 
    # for k in range(5):
    #     if score >= int(grade_num[k]):
    #         k = grade_num[k]
    #         final_grade = (k, grade_rng[k])
    #     print(final_grade)

main()
