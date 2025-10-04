import UIKit

import UIKit

let aar1: [String] = ["Richard", "John", "David"]

print(aar1)

var gradeStet: Set<Int> = [10,20,30,40,50,50]

print(gradeStet)

let set1: Set<String> = ["a","b","c","d","e"]
let set2: Set<String> = ["a","b","c","d","e"]

print(set1 )
// objects --Dictionary key -> value

var person: [String: Int] = ["Richard":30, "John":20, "David":40]
print(person)

var numbers = [1,2,3,4,5]
numbers.remove(at:2)
print(numbers)

var countryAndCapital: [String: String] = ["India": "New Delhi", "USA": "Washington D.C.", "China": "Beijing"]
countryAndCapital["France"] = "Paris"
print(countryAndCapital)
    
var colorList: Set<String> = ["red","green", "blue", "yellow"]
colorList.insert("purple")
colorList.remove("green")
print(colorList)
