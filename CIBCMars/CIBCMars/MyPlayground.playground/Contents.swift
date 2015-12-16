//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Two types of variables: ones you can change and ones you can't -> var vs let
var myName = "Elvina Tse"
let someConstant = 10

// Can also explicitly define data type if you like: int, character, bool, float, double, etc.
var myLastName:String = "Tse"

// Now let's make a function!
func myCoolFunction() -> Void { // Don't need the "-> Void", assumes it is void automatically
    // Inside we have the function body or code block
    print("Hello Mars")
}
func myCoolReturnedFunction() -> String {
    return "Hello World"
}
func addSum(sum1:Int, sum2:Int) {
    print(sum1 + sum2)
}

var someString = "Elvina"
if someString == "Elvina" { // Notice (brackets) aren't needed!
    print("Hi Elvina!")
} else {
    print("Doesn't match :(")
}

