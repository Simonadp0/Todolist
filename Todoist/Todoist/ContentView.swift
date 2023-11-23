//
//  ContentView.swift
//  Todoist
//
//  Created by Simona De Pasquale on 14/11/23.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    //@Binding var newTaskText
    @State var newTaskText = ""
    @Query private var items: [Task]
    @State private var isSheetPresented = false
    @FocusState var focused: Bool?
    @Environment(\.modelContext) var context
    @State private var item = Task()
    //var taskView = Taskviewmodel()
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                List {
                    ForEach(items) { item in
                        HStack {
                            Image (systemName: "circle")
                                .imageScale(.medium)
                            
                            Text (item.title)
                            Text (item.notes).accessibilityHidden(true)
                            /*   Button {
                             withAnimation{
                             item.isCompleted.toggle()
                             }
                             } label: {
                             Image(systemName: "checkmark")
                             .symbolVariant(.circle.fill)
                             .foregroundStyle(item.isCompleted ? .red : .gray)
                             
                             }
                             .buttonStyle(.plain)
                             
                             } */
                        }
                        .swipeActions{
                            Button (role: .destructive) {
                                withAnimation {
                                    context.delete(item)
                                }
                            } label: {
                                Text("Delete")
                            }
                        }
                    }
                    
                    
                    
                    // .padding(.leading, 300)
                    //.padding(.top,550)
                    
                }
                
                Button(action: {
                    isSheetPresented.toggle()
                })  {
                    Image(systemName: "plus")
                }
                .padding()
                .background(Color.red)
                .clipShape(Circle())
                .foregroundColor(.white)
                .padding(.leading, 300)
                .sheet(isPresented: $isSheetPresented) {
                    CustomSheetView(item: item)
                        .presentationDetents([.height(180)])
                }
            }
                .padding(.bottom, -500)
                
                
                .navigationTitle("Today")
                
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            Button {
                                
                            } label: {
                                Label("Copy Link to Today", systemImage: "link")
                            }
                            
                            Divider()
                            
                            Button {
                                
                            } label: {
                                Label("Select Tasks", systemImage: "doc.on.doc")
                            }
                            
                            Button {
                                
                            } label: {
                                Label("View", systemImage: "slider.horizontal.3")
                            }
                            
                            Button {
                                
                            } label: {
                                Label("Activity Log", systemImage: "waveform.path.ecg.rectangle")
                            }
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.red)
                        }
                        
                    }
                }
                )}
            
        }
    }
    
    

