//
//  ContentView.swift
//  Bop
//
//  Created by Justin Hurley on 1/25/21.
//

import SwiftUI
import Amplify
import AmplifyPlugins

let artists = ["Drake","Lady Gaga","Smino","The Who","Dolly Parton","Future","Taylor Swift","Clairo","Amine", "Pop Smoke", "The Beatles", "Mac Miller", "The Strokes", "Steely Dan", "Whitney", "Beach House", "The Pogues", "Doja Cat", "David Bowie", "Modest Mouse"]
struct ContentView: View {
    var body: some View {
        NavigationView{
            //Makes the large line graph at the top
            LineView(data: [8,23,54,32,12,37,7,23,43],title:"Portfolio")
                .padding(.bottom, 200)
            Text("Overall: $10,301.21").onAppear{self.performOnAppear()
            ScrollView{
                LazyVStack{
                    //loop generates the feed that shows a person's portfolio
                    ForEach(artists, id: \.self){ value in
                        let rand = Float.random(in: -100...100)
                        let numShares = Int.random(in: 1...100)
                        Divider()
                        let smallStock = SmallStock(name: value, numShares: Float(numShares), delta: rand)
                        //view that handles the smaller individual stocks views
                        Button(action:{
                            StockView(stock: Stock(name: "\(smallStock.name)", delta: smallStock.delta))
                            print("\(value) pressed!")
                        }){
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
        let s = Stocks(id: "1", name: "Boyz II Men", bopid: "1", quantity: "1")
        let item = User(id: "69696969", username: "superuser",
                       email: "test@gmail.com", portfolio: [s])

        Amplify.DataStore.save(item) { result in
           switch(result) {
           case .success(let savedItem):
               print("Saved item: \(savedItem.username)")
           case .failure(let error):
               print("Could not save item to datastore: \(error)")
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
