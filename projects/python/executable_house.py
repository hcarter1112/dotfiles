#!/usr/bin/env python3

while True:
    name = input("What's your name? ")
    match name:
        case "Harry" | "Hermione" | "Ron":
            print("Gryffindor")
            break
        case "Draco":
            print("Slytherin")
            break
        case _:
            print("Who?")

