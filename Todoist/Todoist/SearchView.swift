//
//  SearchView.swift
//  Todoist
//
//  Created by Simona De Pasquale on 14/11/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var isSearching = false
    var body: some View {
        NavigationView {
            
            VStack {
                SearchBar(text: $searchText)
                Text("")
                    .padding(.top, 550)
                    
            }
            
         .navigationTitle("Search")
         
                }
    }
}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
#Preview {
    SearchView()
}
