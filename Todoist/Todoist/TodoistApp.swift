//
//  TodoistApp.swift
//  Todoist
//
//  Created by Simona De Pasquale on 14/11/23.
//

import SwiftUI
import SwiftData
@main
struct TodoistApp: App {
    
    let container: ModelContainer = {
        let schema = Schema([Task.self])
        let container = try! ModelContainer(for: schema)
        return container
    }()
    
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                   
                
                    .tabItem {
                        Image(systemName: "calendar")
                           
                        Text ("Today")
                           
                    }
                    
                InboxView()
                
                    .tabItem {
                        
                        Image(systemName: "tray")
                            
                        Text ("Inbox")
                        
                    }
                   
                SearchView()
                
                    .tabItem {
                        
                        Image(systemName: "magnifyingglass")
                           
                        Text ("Search")
                       
                    }
                   
                BrowseView()
                
                    .tabItem {
                        
                        Image(systemName: "note.text")
                           
                        Text ("Browse")
                      
                    }
                
                    
            }
        }
        .modelContainer(container)
       
    }
}
