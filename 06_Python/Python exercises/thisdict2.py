import csv

myFile = open('C:\Users\Gebruiker\Desktop\Python exercises\Dictionary.csv', 'r+')

print("The content of the csv file before appending is:")
print(myFile.read())

myDict = {}

myDict["First name"] = input("Enter your first name :")
myDict["Last name"] = input("Enter your last name :")
myDict["Job title"] = input("Enter your Job title :")
myDict["Company"] = input("Enter company name :")

print("The dictionary is:")
print(myDict)

writer = csv.writer(myFile)

writer.writerow(myDict.values())
myFile.close()        
myFile = open('C:\Users\Gebruiker\Desktop\Python exercises\Dictionary.csv', 'r')
print("The content of the csv file after appending is:")
print(myFile.read())