//
//  SearchBar.swift
//  Todoist
//
//  Created by Simona De Pasquale on 17/11/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Tasks, Projects and More", text: $text)
                .padding(8)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                )

            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Text("Cancel")
                        .foregroundColor(.red)
                        .padding(.trailing, 8)
                }
               
            }
        }
        .padding(.horizontal)
       
    }
}
