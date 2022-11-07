import pandas as pd

myDict = {}

myDict["First name"] = input("Enter your first name :")
myDict["Last name"] = input("Enter your last name :")
myDict["Job title"] = input("Enter your Job title :")
myDict["Company"] = input("Enter company name :")

df = pd.DataFrame(myDict, columns = ["First name", "Last name", "Job title","Company"])
print(df)

df.to_csv('raw_data.csv', index=False)