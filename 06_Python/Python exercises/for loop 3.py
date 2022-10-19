lst = [10,20,30,40,50]


for i in range(len(lst)):
    if i < len(lst)-1 :
        print(lst[i]+lst[i+1])
        
    else:
        print(lst[i]+lst[0])
    

