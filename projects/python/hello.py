"""
This is how to use the print function. 
# Line from the documentation for the 'print' function
print(*objects, sep = ' ', end = '\n', file = sys.stdout, flush = false)

print("hello,", x) - this will print the arguments in the parenthases with a space in 
between automatically

print("hello, <space>" + x) - the space is needed here since the space is not inserted
automatically

# this is a format string. The "f" at the beginning lets python know that the string
# is special

print(f"hello, {name}")
"""
"""
####### HELLO 
name = input("What's your name? ").strip().title()

# Split name into first and last
first, last = name.split(" ")

# Remove whitespace from string and capitalize
# name = name.strip().title()

# Capitalize the string
# name = name.capitalize()
#
# Make the first letters of each object capital
# name = name.title()
print("Hello,", first)
"""
def main():
    name = input("What's your name? ").strip().title()
    hello(name)

def hello(to="world"):
    print("Hello,", to)

main()
