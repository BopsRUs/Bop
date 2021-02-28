//
//  SearchView.swift
//  Bop
//
//  Created by Justin Hurley on 2/17/21.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Browse")
                .multilineTextAlignment(.leading)
                .padding([.top, .leading, .trailing], 20.0)
            SearchBar(text: .constant(""))
            Spacer()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
