import UIKit

// constent array

var fruits: [String] = ["apple", "banana", "orange"]
                        //0        1          2\
print("The first value is:", fruits[0])
print("the fisrts value is: \(fruits[0])")


for fruit in fruits {
    print(fruit)
}


for (index, fruit) in fruits.enumerated() {
    print("\n The \(index) the fruitis: \(fruit)")
}

 fruits.append("mango")
 print(fruits)
 
 // adding multiple items
 
 fruits.append(contentsOf: ["pineapple", "guava"])
 print(fruits)
 
 //removing items
 fruits.remove(at: 0)
 print(fruits)
 
 //fruits.removeAll()
 //print(fruits)
 
 //Searching an item
 
 
 print(fruits.contains("banana")) // case sensitive
 
 //Sorting
 
 print(fruits)
 print(fruits.sorted(by: >))
 
 print(fruits.reversed())

