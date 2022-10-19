numList=[4,6,3,5,10,10]
print("My List is "+str(numList))
for i in range(0, len(numList)):
   if(i == (len(numList)-1)):
       print(numList[i]+numList[0])
   else:
       print(numList[i]+numList[i+1])