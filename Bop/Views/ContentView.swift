//
//  ContentView.swift
//  Bop
//
//  Created by Justin Hurley on 1/25/21.
//

import SwiftUI
let artists = ["Drake","Lady Gaga","Smino","The Who","Dolly Parton","Future","Taylor Swift","Clairo","Amine", "Pop Smoke", "The Beatles", "Mac Miller", "The Strokes", "Steely Dan", "Whitney", "Beach House", "The Pogues", "Doja Cat", "David Bowie", "Modest Mouse"]
let totalPortfolioValue = "10,233.20"
struct ContentView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                //Makes the large line graph at the top
                LineView(data: [8,23,54,32,12,37,7,23,43])
                    .padding(.bottom, 120)
                    .padding(.top, 60)
                    .navigationBarTitle("Portfolio \n $\(totalPortfolioValue)", displayMode: .large)
                LazyVStack{
                    //loop generates the feed that shows a person's portfolio
                    ForEach(artists, id: \.self){ value in
                        let rand = Float.random(in: -100...100)
                        let numShares = Int.random(in: 1...100)
                        Divider()
                        let smallStock = SmallStock(name: value, numShares: Float(numShares), delta: rand)
                        //view that handles the smaller individual stocks views
                        NavigationLink(destination: StockView(stock: Stock(name: "\(smallStock.name)", delta: smallStock.delta))){
                            SmallStockView(smallStock: smallStock)
                                //this sets all text color to black in the view
                                .foregroundColor(.black)
                        }
                    }
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

func log(_ log: String) -> EmptyView {
    print("** \(log)")
    return EmptyView()
}
