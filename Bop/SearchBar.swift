//
//  SearchBar.swift
//  Bop
//
//  Created by Justin Hurley on 2/17/21.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    var body: some View {
        TextField("Search...",text: $text)
            .padding(7)
           .padding(.horizontal, 25)
           .background(Color(.systemGray6))
           .cornerRadius(8)
           .padding(.horizontal, 10)
           .onTapGesture {
               self.isEditing = true
           }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
