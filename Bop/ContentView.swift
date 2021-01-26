//
//  ContentView.swift
//  Bop
//
//  Created by Justin Hurley on 1/25/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Bop")
            .fontWeight(.heavy)
            .foregroundColor(Color.green)
            .padding(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
