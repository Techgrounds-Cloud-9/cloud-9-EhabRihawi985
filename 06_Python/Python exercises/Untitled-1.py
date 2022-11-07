var_dict={"FirstName":"Gokul","LastName":"Kathirvel","Title":"Business Analyst","Company":"TCS"}
#printing the original dictionary 
print("Original Dictionary is " +str(var_dict))
# using the in operator in for loop to get the key value pair
for i in var_dict:
    print(i ,var_dict[i])
# using the dict.items() in the loop to access the key value pair
print("Dictionary key value pairs are:")
for key,value in var_dict.items():
    print(key,value)
# using enumerate() function to iterate
print("Dictionary key value pairs using enumerate")
for i in enumerate(var_dict.items()):
    print(i)