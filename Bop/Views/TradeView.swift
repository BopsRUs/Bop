//
//  TradeView.swift
//  Bop
//
//  Created by Justin Hurley on 4/7/21.
//

import SwiftUI
//object that handles all vars on the trade screen
class TradeObject {
    var stockName: String
    var sharesOwned: Double
    var currPrice: Double
    init(stockName: String, sharesOwned: Double, currPrice: Double){
        self.stockName = stockName
        self.sharesOwned = sharesOwned
        self.currPrice = currPrice
    }
}

struct TradeView: View {
    var tradeObject: TradeObject
    @State private var buySellIndex = "buy"
    @State private var numShares = "0.0"
    var body: some View {
        VStack{
            Form{
                Section{
                    Text("\(tradeObject.stockName)")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("Current Price: \(tradeObject.currPrice, specifier: "%.2f") per share")
                }
                Section{
                    Picker("Buy/Sell", selection: $buySellIndex, content:{
                        Text("Buy").tag("buy")
                        Text("Sell").tag("sell")
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    
                    HStack{
                        Spacer()
                        TextField("Shares to trade", text: $numShares)
                            .frame(width: 90, height: 50, alignment: .center)
                            .keyboardType(.decimalPad)
                            .background(Color.gray)
                            .cornerRadius(5)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                }
                Section{
                    HStack{
                        Spacer()
                        Text("User will \(buySellIndex) \(numShares)")
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Button(action: {
                            //code to execute trade goes here
                            print("Trade executed to \(buySellIndex) \(numShares) of \(tradeObject)")
                        }, label: {
                            Text("Trade")
                                .frame(width: 90, height: 50, alignment: .center)
                                .background(RoundedRectangle(cornerRadius: 4)
                                                .fill(Color.blue))
                                .foregroundColor(Color.white)
                        })
                        Spacer()
                    }
                }
            }
            .navigationBarTitle("Trade")
        }
    }
}

struct TradeView_Previews: PreviewProvider {
    static var previews: some View {
        TradeView(tradeObject: TradeObject(stockName: "Becky G", sharesOwned: 120.3, currPrice: 12.4))
    }
}
