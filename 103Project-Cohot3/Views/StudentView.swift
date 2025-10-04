//
//  StudentView.swift
//  103Project-Cohot3
//
//  Created by Richard Dillard on 10/1/25.
//

import SwiftUI

struct StudentView: View {
    @State private var studentName: String = ""
    @State private var studentGrade: String = ""
   
    @State private var studentNames: [String] = ["Alice", "Bob", "Charlie","Richard","Lindsey","Albert"]
    
    @State private var studentNameAndGrades: [String: [Int]] = [
        "Alice": [88],
        "Bob": [90],
        "Charlie": [70],
        "Richard": [80],
        "Lindsey": [100],
        "Albert": [90]
    ]
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()
                
                VStack() {
                    Text("Students Grades")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .padding()
                   // Text("Average Grade: \(calculateAverage(studentNameAndGrades)) \n")
                      //  .font(.subheadline)
                                        
                    
                    List{
                        
                        ForEach(studentNames, id: \.self) { name in
                            Text("\(name) - \(studentNameAndGrades[name]!)")
                        }
                    }
                    .listStyle(PlainListStyle())
                    .scrollContentBackground(.hidden)
                    
                    HStack {
                        TextField("Student Name", text: $studentName)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 1)
                                .opacity(0.2))
                            .padding()
                        
                       TextField("Grade", text: $studentGrade)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 1)
                            .opacity(0.2))
                            
                        
                        Button(action: {
                            addStudent(studentName, studentGrade)
//
                            studentName = ""
                            studentGrade = ""

                        }) {
                            Image(systemName:"arrowshape.up.fill")
                                .padding()
                                .background(Color.blue)
                                .foregroundStyle(Color.white)
                                .cornerRadius(30)
                        }
                        
                    }//end of hstack
                    .padding()
                }//end of vstack
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .cornerRadius(20)
                .padding()
            }//end of zstack
            .navigationBarTitle("Grade Book", displayMode: .inline)
            .toolbar{
                Menu{
                    Button("sort A -> z"){
                        studentNames.sort()
                    }
                    
                    
                    Button("Reverse Order"){
                        studentNames.reverse()
                    }
                } label : {
                    Image(systemName: "arrow.up.arrow.down.circle")
                        .imageScale(.large)
                }
            }
        }//end of navView
        
    } // end of body
    private func addStudent(_ studentName: String, _ studentGrade: String){
        if !studentName.isEmpty{
            studentNames.append(studentName)
            studentNameAndGrades[studentName] = [Int(studentGrade)!]
        }
    }
    
   /* private func calculateAverage(_ students: [String: [Int]])-> Double{
        // get all the grades of every student
        var avgs:[String: Double] = [:]
        
        for(student, grades) in students{
            let avg = Double(grades.reduce(0, +)) / Double(grades.count)
            avgs[student] = avg
        }
        
    
        
//        var total: Double = 0
//        for grade in grades{
//            total += grade
//        }
//        return total/Double(grades.count)
    }*/
}//end of StudentView

#Preview {
    StudentView()
}
