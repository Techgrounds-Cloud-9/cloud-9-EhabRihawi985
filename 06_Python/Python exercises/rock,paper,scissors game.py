"""
    Rock Paper Scissors:
    The player plays against a computer opponent typing either a letter (rps) or an entire word (rock paper scissors) to play their move.
    Create a function that checks whether the move is valid or not.
    Create another function to create a computer move.
    Create another function to check who wins the round.
    Finally, create a function that keeps track of the score.
    The game should be played in a predetermined number of rounds.
"""
import random

x = ["rock", "paper", "scissors"]

print(" X list is :",x)



def fun_one():
    comp = random.choice(x)
    return comp
z = 0    
z = fun_one()

print("Computer choose :",z)


def fun_two():
    player = input("enter a value from x list: ")
    return player
y = 0
y = fun_two()

print("You choose :",y)

while True:
    if y == x[0] and z == x[0]:
        print("No drow, pick choice again!")
        z  = fun_one()
        y = fun_two()
    elif y == x[0] and z == x[1]:
        print("Computer wins!")
        break
    elif y == x[0] and z == x[2]:
        print("You win!")
        break
    elif y == x[1] and z == x[0]:
        print("You win!")
        break
    elif y == x[1] and z == x[1]:
        print("No drow, pick choice again!")
        z = fun_one()
        y = fun_two()
    elif y == x[1] and z == x[2]:
        print("Computer wins")
        break
    elif y == x[2] and z == x[0]:
        print("Computer wins!")
        break
    elif y == x[2] and z == x[1]:
        print("You win!")
        break
    elif y == x[2] and z == x[2]:
        print("No drow, pick choice again!")
        z = fun_one()
        y = fun_two()
    else:
        print("Please enter a value from the X list :",x)
        y = fun_two()
