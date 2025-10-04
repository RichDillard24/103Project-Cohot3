//
//  ShoppingListView.swift
//  103Project-Cohot3
//
//  Created by Richard Dillard on 9/29/25.
//

import SwiftUI

struct ShoppingListView: View {
    
    @State private var shoppingList: [String] = ["Eggs","Apples"]
    @State private var newItem: String = ""
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()
                VStack{
                    
                    Text("Shopping List")
                        .font(.largeTitle)
                        .foregroundStyle(Color.blue)
                        .padding()
                    
                    //List of items in the shopping list
                    List{
                        ForEach(shoppingList, id:\.self){ item in
                            Text(item)
                            
                        }
                    }
                    .listStyle(PlainListStyle())
                    .scrollContentBackground(.hidden)
                    
                    HStack{
                        
                        TextField("Add new shopping item..", text: $newItem)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 1)
                                .opacity(0.2))
                            .padding()
                        
                        Button(action:{
                            addItem(item: newItem)
                            newItem = ""
                        }){
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
                
                
            }//End ZStack
            .navigationBarTitle("Listify", displayMode: .inline)
            
            .toolbar{
                Menu{
                    Button("sort A -> z"){
                        
                    }
                    
                    
                    Button("Reverse Order"){
                        
                    }
                } label : {
                    Image(systemName: "arrow.up.arrow.down.circle")
                        .imageScale(.large)
                }
                
                .padding()
            }//ned NavView
            
        }//end of body
    }// end body
    private func addItem(item: String){
        if !item.isEmpty{
            shoppingList.append(item)
        }
    }
    
}//end of shoppingView
    
    
    #Preview {
        ShoppingListView()
    }

