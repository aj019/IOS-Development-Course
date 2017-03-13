//: Playground - noun: a place where people can play

import UIKit

var str = "Hello "

var newStr = str + "Rob!"

for char in newStr.characters{
    print(char)
}

let nsstring =  NSString(string : newStr)

nsstring.substring(from: 5)
nsstring.substring(to: 5)
NSString(string: nsstring.substring(from: 6)).substring(to: 3)
nsstring.substring(with: NSRange(location: 6,length: 3))

if nsstring.contains("Rob"){
    
    print("String contains Rob")
}

nsstring.components(separatedBy: ",")