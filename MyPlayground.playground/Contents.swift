//: Playground - noun: a place where people can play

import UIKit



//Dictionaries

//Basically for key value pairs simialr to Hashmap in Java
var dictionary = ["computer":"something to play call of duty on"]
print(dictionary["computer"]!)
print(dictionary.count)
dictionary["pen"] = "djhwd"
print(dictionary)

var game = [String:Decimal]()
game["age"] = 2.3
print(game)

/*   Challenge Menu */

var menu = ["pizza":10.99,"ice cream":4.99]
var total = menu["pizza"]! + menu["ice cream"]!
print(total)

// Array

var array = [32,32,43]

print(array[2])

print(array.count)
array.append(7)

array.remove(at: 1)

print(array)

//Challenge 3.87 , 7.1,8.9
var array1 = [3.87,7.1,8.9]
array1.remove(at: 1)
array1.append(array1[0] * array1[1])
print(array1)



// If else statement

let age = 13

if age > 18 {
    print("not 18")
}else{
    print(" less than 18")
}

let name = "Anuj"

if(name == "Anuj"){
    
    print(name)
}

let isMale = true

if isMale {
    print("true")
}

// For Loop

var arr = [2,3,4,5]

for number in arr{
    print(number)
}


