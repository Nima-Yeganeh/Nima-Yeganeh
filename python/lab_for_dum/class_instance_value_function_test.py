class MyClass:
    Greeting = ""
    def __init__(self, Name="there"):
        self.Greeting = Name + "!"
    def SayHello(self):
        print("Hello {0}".format(self.Greeting))
MyInstance1 = MyClass("Amy")
MyInstance1.SayHello()
MyInstance2 = MyClass("Harry")
MyInstance2.SayHello()

