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



def Computer_selection():
    comp = random.choice(x)
    return comp
 
z = Computer_selection()

print("Computer choose :",z)




def Player_selection():
    q = int(input("enter (1 for rock) or (2 for paper) or (3 for scissors) "))
    x = ["rock", "paper", "scissors"]
    while True:
        if q == 1:
            y = x[0]
            print("You choose rock!")
            return y
        elif q == 2:
            y = x[1]
            print("You choose for paper!")
            return y
        elif q == 3:
            y = x[2]
            print("you choose for scissors!")
            return y
        elif q == 0:
            q = int(input("enter (1 for rock) or (2 for paper) or (3 for scissors) "))
        else:
            q = int(input("enter (1 for rock) or (2 for paper) or (3 for scissors) "))
        
y = Player_selection()


while True:
    if y == x[0] and z == x[0]:
        print("No drow, pick choice again!")
        z  = Computer_selection()
        y = Player_selection()
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
        z = Computer_selection()
        y = Player_selection()
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
        z = Computer_selection()
        y = Player_selection()
    else:
        print("Please enter a value from the X list :",x)
        y = Player_selection()
