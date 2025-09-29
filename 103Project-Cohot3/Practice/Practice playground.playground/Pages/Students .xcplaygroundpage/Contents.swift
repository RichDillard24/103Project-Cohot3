//: [Previous](@previous)

import Foundation

func calculateAverage(grades: [Double])-> Double{
    var total: Double = 0
    for grade in grades{
        total += grade
    }
    return total/Double(grades.count)
}

let studentNames: [String] = ["Alice", "Bob", "Charlie","Richad","Lindsey"]

let studentGrades: [String:[Double]] = [
    "Alice": [88.0, 90.0,80.0],
    "Bob": [90.0, 80.0,90.0],
    "Charlie": [70.0, 80.0,90.0],
    "Richad": [80.0, 80.0,90.0],
    "Lindsey": [90.0, 90.0,90.0],
]



print("Students Record \n")


for studentName in studentNames {
    print("Student:\(studentName)\n")
    print("Grades: \(studentGrades[studentName]!)\n")
    print("avg: \(calculateAverage(grades: studentGrades[studentName]!))\n")
}
