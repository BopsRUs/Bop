//
//  ContentView.swift
//  Bop
//
//  Created by Justin Hurley on 1/25/21.
//

import SwiftUI
let artists = ["Drake","Lady Gaga","Smino","The Who","Dolly Parton","Future","Taylor Swift","Clairo","Amine", "Pop Smoke", "The Beatles", "Mac Miller", "The Strokes", "Steely Dan", "Whitney", "Beach House", "The Pogues", "Doja Cat", "David Bowie", "Modest Mouse"]
struct ContentView: View {
    var body: some View {
        ScrollView{
            LineView(data: [8,23,54,32,12,37,7,23,43],title:"Portfolio")
                .padding(.bottom, 200)
            Text("Overall: $10,301.21")
            LazyVStack{
                ForEach(artists, id: \.self){ value in
                    let rand = Float.random(in: -100...100)
                    let numShares = Int.random(in: 1...100)
                    Divider()
                    HStack{
                        //Left elements
                        VStack(alignment: .leading){
                            Text("\(value)")
                            Text("Shares: \(numShares)")
                                .fontWeight(.light)
                                .font(.system(size: 15))
                        }
                        Spacer()
                        //logic handles color for stock change box
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
                    .clipped()
                    
                }
            }
        }
        .padding(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func log(_ log: String) -> EmptyView {
    print("** \(log)")
    return EmptyView()
}
