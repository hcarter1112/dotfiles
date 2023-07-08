while True:
    equ = input("enter numbers and an operator separated by spaces: \n")
    num1_str, op, num2_str = equ.split(" ")
    
    num1 = float(num1_str)
    num2 = float(num2_str)
    
    # ops = ['*', '/', '+', '-']
    if op == '+':
        ans = round(num1 + num2, 5)
    elif op == '-':
        ans = round(num1 - num2, 5)
    elif op == '/':
        ans = round(num1 / num2, 5)
    elif op == '*':
        ans = round(num1 * num2, 5)
    else:
        print("please enter two numbers separated by one of these operators: '+' '-' '*' or '/'")

    # This syntax configures the separator (eg. 1000 --> 1,000)
    print(f"{ans:,}")
