def hello(argcount, *varargs):
    print("Number of arguments:",argcount)
    for arg in varargs:
        print(arg)
hello(1, "Hello!")
hello(4, "One", "Two", "Three", "Four")
