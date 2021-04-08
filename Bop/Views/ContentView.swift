//
//  ContentView.swift
//  Bop
//
//  Created by Justin Hurley on 1/25/21.
//

import SwiftUI
import Amplify
import AmplifyPlugins

let names = ["Drake","Lady Gaga","Smino","The Who","Dolly Parton","Future","Taylor Swift","Clairo","Amine", "Pop Smoke", "The Beatles", "Mac Miller", "The Strokes", "Steely Dan", "Whitney", "Beach House", "The Pogues", "Doja Cat", "David Bowie", "Modest Mouse"]
let totalPortfolioValue = "10,233.20"
let data = dummyDoubleArray(size: 50)
struct ContentView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                //Makes the large line graph at the top
                LineView(data: data, lineWidth: 4)
                    .frame(height: 200)
                    .navigationBarTitle("Portfolio \n $\(totalPortfolioValue)", displayMode: .large)
                Text("Overall: $\(totalPortfolioValue)")//.onAppear{self.performOnAppear()
                LazyVStack{
                    //loop generates the feed that shows a person's portfolio
                    ForEach(names, id: \.self){ value in
                        let data = dummyDoubleArray(size: 15)
                        let numShares = Int.random(in: 1...100)
                        Divider()
                        let smallStock = SmallStock(name: value, numShares: Double(numShares), data: data)
                        //view that handles the smaller individual stocks views
                        NavigationLink(destination: StockView(stock: StockData(name: "\(smallStock.name)", delta: smallStock.delta, shares: smallStock.numShares))){
                            SmallStockView(smallStock: smallStock)
                                //this sets all text color to black in the view
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .padding(.top)
        }
    }

    }
    func performOnAppear() {
//        let s = Stocks(id: "1", name: "Boyz II Men", bopid: "1", quantity: "1")
//        let item = User(id: "69696969", username: "superuser",
//                       email: "test@gmail.com", portfolio: [s])

        Amplify.DataStore.query(Stocks.self) { result in
           switch(result) {
           case .success(let savedItem):
               print("Saved item: \(savedItem)")
           case .failure(let error):
               print("Could not save item to datastore: \(error)")
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
