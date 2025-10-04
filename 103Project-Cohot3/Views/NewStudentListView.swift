//
//  NewStudentListView.swift
//  103Project-Cohot3
//
//  Created by Richard Dillard on 10/1/25.
//

import SwiftUI

struct NewStudentListView: View {
   @State private var students: [Student] = [
        Student(name:"Richard", grade: 67.79),
        Student(name:"Lindsey", grade: 100.00),
        Student(name:"John", grade: 92.00),
    ]
    
    // define the state var for the inpputs
    @State private var newStudentName: String = ""
    @State private var newStudentGrade: String = ""
    var body: some View {
      
            NavigationView {
                ZStack {
                    Color.gray.opacity(0.2)
                        .ignoresSafeArea()
                    
                    VStack(){
                        Text("Student List")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                            .padding()
                        Text("Grade Average: \(average(), specifier: "%.2f")")


                        List(students, id:\.name) {student in
                            Text("\(student.name) - \(student.grade, specifier: "%.2f")")
                        }
                        
                        HStack {
                            TextField("Add a new student", text: $newStudentName)
                                .padding()
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray, lineWidth: 1)
                                        .opacity(0.2))
                            TextField("Grade", text: $newStudentGrade)
                                .padding()
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray, lineWidth: 1)
                                        .opacity(0.2))
                            
                            Button("Add"){
                                if let grade = Float(newStudentGrade){
                                    let student = Student(name:newStudentName, grade: grade)
                                    students.append(student)
                                    newStudentName = ""
                                    newStudentGrade = ""
                                }
                            }
                            .padding()
                        }//end of Hstack
                        .padding()
                    }//end of VStack
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding()
                }//end of zstack
                .navigationBarTitle("Grade Book",displayMode: .inline)
                .toolbar{
                    Menu{
                        Button("sort A -> Z"){
                            students.sort {$0.name < $1.name}
                        }
                        
                        Button("Reverse Order"){
                            students.reverse()
                        }
                    } label : {
                        Image(systemName: "arrow.up.arrow.down.circle")
                            .imageScale(.large)
                    }
                }
        }//end of navVie
      
    }//end of body
  private func average() -> Float {
      let sum = students.reduce(0.0){ result, student in
          result + student.grade
      }
      return Float(sum) / Float(students.count)
  }
    }//end of Struct
#Preview {
    NewStudentListView()
}
