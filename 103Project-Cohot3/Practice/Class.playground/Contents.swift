import UIKit

class Pet:CustomStringConvertible{
    //attributes -> Data/Var/constents
    var name: String
    var age: Int
    var owner: String
    
    //methods
    init(name: String , age: Int, owner: String){//constructor
        self.name = name
        self.age = age
        self.owner = owner
    }
    var description: String{
        return "Name: \(name), Age: \(age), Owner: \(owner)"
    }
}
let pet1 = Pet(name: "Baxter", age: 2, owner: "Rich")

print("Pet Name is: \(pet1.name)")

print(pet1)
