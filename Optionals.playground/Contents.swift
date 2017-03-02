//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var number : Int?
print(number)

let enteredtext = "four"
//let enteredtext = "4"

let enterInt = Int(enteredtext)
if let catAge = enterInt{
    print(catAge * 7)
}else{
    //show an error message
    print("Entered text is not int")
}
