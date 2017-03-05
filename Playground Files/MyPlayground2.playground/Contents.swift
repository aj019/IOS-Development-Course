//: Playground - noun: a place where people can play

import UIKit

var array = [2,3,4,4]

for num in array{
    
    print(num)
}


//Create an array with a list of friends and family

var friends = ["Meenu","Karan","Loveleen"]

for names in friends{
    print("Hi there " + names)
}

for (index,value) in friends.enumerated(){
    
    print("\(index) + \(value )")
}

//Challenge create an array of no's 8,7,19,5 and half it
var arr = [Decimal]()
 arr = [8,7,19,5]
//var arr = [8.0,7.0,19.0,5.0]

for(index,value) in arr.enumerated(){
    
    arr[index] = value/2
}
print(arr)