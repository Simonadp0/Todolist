//
//  Task.swift
//  Todoist
//
//  Created by Simona De Pasquale on 15/11/23.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Task {
    
    var title: String
    var notes: String
    //var imageName: String = "circle"
   /* var isCompleted: Bool */
    init(title: String = "",
         notes: String = " "
       /* isCompleted: Bool = false */
    ) {
        self.title = title
        self.notes = notes
       /* self.isCompleted = isCompleted */
    }
    
}
