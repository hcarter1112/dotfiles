def main():
    err = "Please enter a positive number greater than zero!"
    n = 0
    while True:
        n = input("How many times will the cat meow? ")
        if n.isnumeric():
            n = int(n)
            if n > 0:
                meow(n)
        else:
            error()
            continue
        break

def meow(n):
    for i in range(n):
        print("meow")

def error():
    print("ERROR: Please enter a positive number greater than zero!")


main()
