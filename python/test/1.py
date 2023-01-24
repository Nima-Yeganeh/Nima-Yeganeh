import turtle
import random
turtle.bgcolor('black')
turtle.colormode(255)
turtle.speed(0)
for x in range(500):
    r,b,g=random.randint(50,255),random.randint(100,255),random.randint(150,255)
    turtle.pencolor(r,g,b)
    turtle.fd(x+0)
    turtle.rt(91)
turtle.exitonclick()
