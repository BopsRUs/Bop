//
//  ContentView.swift
//  Bop
//
//  Created by Justin Hurley on 1/25/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ScrollView{
            LazyVStack{
                LineGraph()
                ForEach(1...100, id: \.self){ value in
                    let rand = Float.random(in: -100...100)
                    HStack{
                        Text("Stock: ")
                        Spacer()
                        if(rand >= 0){
                            Text("+\(rand,specifier: "%.2f")")
                                .padding(.trailing, 6.0)
                                .frame(width: 70, height: 30, alignment: .trailing)
                                .background(RoundedRectangle(cornerRadius: 4)
                                                .fill(Color.green))
                        }
                        else{
                            Text("\(rand,specifier: "%.2f")")
                                .padding(.trailing, 6.0)
                                .frame(width: 70, height: 30, alignment: .trailing)
                                .background(RoundedRectangle(cornerRadius: 4)
                                                .fill(Color.red))
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    Divider()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
