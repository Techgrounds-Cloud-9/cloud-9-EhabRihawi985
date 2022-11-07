
def game_start():

    import random

    x = ["rock", "paper", "scissors", "paper", "scissors", "rock","scissors", "rock","paper"]

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
        if y ==  z:
            print("No drow, pick choice again!")
            z  = Computer_selection()
            y = Player_selection()
        elif y == x[0] and z == x[1]:
            print("Computer wins!")
            return c + 1
        elif y == x[0] and z == x[2]:
            print("You win!")
            return p + 1
        elif y == x[1] and z == x[0]:
            print("You win!")
            return p + 1
        elif y == x[1] and z == x[2]:
            print("Computer wins")
            return c + 1
        elif y == x[2] and z == x[0]:
            print("Computer wins!")
            return c + 1
        elif y == x[2] and z == x[1]:
            print("You win!")
            return p + 1
        else:
            print("Please enter a value from the X list :",x)
            y = Player_selection()
        
p = 0

c = 0

for i in range(12):
    if p == 5 and c < 5:
        print("Computer wins with five!")
    elif c == 5 and p < 5:
        print("You won with five!")
    else:
        v = game_start()
        print(v)