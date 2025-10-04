//
//  ProfessorView.swift
//  103Project-Cohot3
//
//  Created by Richard Dillard on 10/4/25.
//

import SwiftUI

struct ProfessorView: View {
    
    
    @State private var professors: [Professor] = [
        Professor(firstName:"Richard" , lastName:"Dillard",phoneNumber: "(123)456-7890"),
        Professor(firstName:"John" , lastName:"Doe",phoneNumber: "(123)456-7890")
    ]
    @State private var newFirstName: String = ""
    @State private var newLastName: String = ""
    @State private var newPhoneNumber: String = ""
    
    var body: some View {
        
        NavigationView{
            ZStack{
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()
                
                VStack{
                    Text("Professors")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .padding()
                    
                    List(professors, id:\.firstName){ professor in
                        Text("\(professor.firstName)  \(professor.lastName) - \(professor.phoneNumber)")
                    }
                    HStack{
                        TextField("First Name", text: $newFirstName)
                            .padding()
                            .background(Color.white)
                            .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                                .opacity(0.2))
                        
                        TextField("Last Name", text: $newLastName)
                            .padding()
                            .background(Color.white)
                            .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                                .opacity(0.2))
                        TextField("Phone Number", text: $newPhoneNumber)
                            .padding()
                            .background(Color.white)
                            .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                                .opacity(0.2))
                        
                        Button("add"){
                            let professor = Professor(firstName: newFirstName, lastName: newLastName, phoneNumber: newPhoneNumber)
                            professors.append(professor)
                            newFirstName = ""
                            newLastName = ""
                            newPhoneNumber = ""
                            
                        }
                        .padding()
                    }//end of hstack
                    .padding()
                }//end of vstack
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .cornerRadius(20)
                .padding()
            }//end of zstak
            .navigationBarTitle("List of Professors",displayMode: .inline)
            .toolbar{
                Menu{
                    Button("Sort A-Z"){
                        professors.sort { $0.firstName < $1.firstName }
                    }
                    Button("Reverse Order"){
                        professors.reverse()
                    }
                } label :{
                    Image(systemName:"arrow.up.arrow.down.circle")
                        .imageScale(.large)
                }
            }
        }//end of navigationView
    }//end of body
}//end of professView
#Preview {
    ProfessorView()
}
