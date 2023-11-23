//
//  CustomSheetView.swift
//  Todoist
//
//  Created by Simona De Pasquale on 16/11/23.
//

import SwiftUI
import SwiftData

struct CustomSheetView: View {
    //@Binding var isSheetPresented: Bool
    //@Binding var newTaskText : String
    //@State  var newTasksText = ""
    @FocusState var focused: Bool?
    
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @Bindable var item: Task
    //var onAddTask: (String) -> Void
    
    
   // var taskView = Taskviewmodel()
   
    
    var body: some View {
        VStack {
            
            TextField("Task Name", text: $item.title)
                .focused($focused, equals: true)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now())
                    {
                        self.focused = true
                    }
                }
                .textFieldStyle(.automatic)
                .padding([.leading, .top], 15)
            
            Divider()
            
            TextField("Description", text: $item.notes, axis: .vertical)
                .lineLimit(1...8)
                .textFieldStyle(.automatic)
                .padding([.leading, .top], 15)
                .accessibilityHidden(true)
                
            
            HStack {
                
                /*
            Button {
                
                taskView.tasks.append(Task(text: newTaskText))
                newTaskText = ""
                taskView.tasks.append(Task(text: newTasksText))
                newTasksText = ""
                 
                onAddTask(newTaskText)
                newTaskText = ""
                isSheetPresented.toggle()
                 
            } label: {
                Image(systemName: "arrow.up")
                 
            }
                 */
                Button {
                    withAnimation{
                        context.insert(item)
                    }
                    dismiss()
                } label: {
                    Image(systemName: "arrow.up")
                }
               
            .padding()
            .imageScale(.small)
            .background(Color.red)
            .clipShape(Circle())
            .foregroundColor(.white)
            .padding(.leading, 300)
            
        }
        Spacer()
        .background(Color.white)
        .cornerRadius(10)
        //.padding()
        //.frame(height: UIScreen.main.bounds.height / 2)
        //.offset(y: isSheetPresented ? UIScreen.main.bounds.height / 4 : UIScreen.main.bounds.height)
    }
        
    }
}


