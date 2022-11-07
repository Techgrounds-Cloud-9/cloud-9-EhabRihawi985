import csv

myDict = {}

myDict["First name"] = input("Enter your first name :")
myDict["Last name"] = input("Enter your last name :")
myDict["Job title"] = input("Enter your Job title :")
myDict["Company"] = input("Enter company name :")

print("The dictionary is:")
print(myDict)

myFile = open('Dictionary.csv', 'r+') 

print(myFile.read())

writer = csv.writer(myFile)
writer.writerow(myDict.keys())
writer.writerow(myDict.values())

myFile.close()