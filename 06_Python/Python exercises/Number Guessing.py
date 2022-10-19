
# Number Guessing:
# Generate a random number between 1 and 100 (or any other range).
# The player guesses a number. For every wrong answer the player receives a clue.
# When the player guesses the right number, display a score.

import random

x = random.randint(1, 100)

print(x)

y = int(input("Please enter number in range of 100 :"))

while y != x:
    if y > x:
        print("Your guess is too high")
    elif y < x:
        print("Your guess is too small")
    y = 0
    y = int(input("Please enter number in range of 100 :"))
    if y == x:
        for i in range(100):
            z = 0
            z = i + (i+1)
            print("Good guess, your score is :",z)
            break

score = z


  

     
