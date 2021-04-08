//
//  StockView.swift
//  Bop
//
//  Created by Justin Hurley on 2/26/21.
//

import SwiftUI

//general class for Stock Data, used to hold infomation needed to display stock information
class StockData{
    var name: String = ""
    var delta: Double = 0.0
    var dayData: [(Double)]
    var weekData: [(Double)]
    var monthData: [(Double)]
    var sixMonthData: [(Double)]
    var yearData: [(Double)]
    var maxData: [(Double)]
    var shares: Double
    
    init(name: String, delta: Double, shares: Double){
        self.name = name
        self.dayData = dummyDoubleArray(size: 30)
        self.weekData = dummyDoubleArray(size: 30)
        self.monthData = dummyDoubleArray(size: 30)
        self.sixMonthData = dummyDoubleArray(size: 30)
        self.yearData = dummyDoubleArray(size: 30)
        self.maxData = dummyDoubleArray(size: 30)
        self.delta = getDifference(data: self.dayData)
        self.shares = shares
    }
    func getMaxOfDay() -> Double{
        return dayData.max() ?? 0.0
    }
    func getMinOfDay() -> Double{
        return dayData.min() ?? 0.0
    }
    func getMaxOfYear() -> Double{
        return yearData.max() ?? 0.0
    }
    func getMinOfYear() -> Double{
        return yearData.min() ?? 0.0
    }
    func getCurrPrice() -> Double{
        return dayData.last ?? 0.0
    }
}
struct StockView: View {
    var stock : StockData
    var body: some View {
        VStack{
            LineView(data: stock.dayData, lineWidth: 4)
                .frame(height: 200)
            Divider()
            HStack{
                Image("ross")
                    .resizable()
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                    .padding()
                    .navigationBarTitle(stock.name)
                    .navigationBarItems(trailing: NavigationLink(destination:TradeView(tradeObject: TradeObject(stockName: stock.name, sharesOwned: stock.shares, currPrice: stock.delta))){
                            Text("Trade")
                        })
                Text("\(stock.getCurrPrice(), specifier: "%.2f")")
                    .padding()
                //logic for gain/loss color
                if(stock.delta >= 0){
                    Text("+\(stock.delta,specifier: "%.2f")")
                        .frame(width: 90, height: 50, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 4)
                                        .fill(Color.green))
                }
                else{
                    Text("\(stock.delta,specifier: "%.2f")")
                        .frame(width: 90, height: 50, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 4)
                                        .fill(Color.red))
                }
                Spacer()
            }
            Divider()
            Text("Current Price: \(stock.getCurrPrice(), specifier: "%.2f")")
            Divider()
            HStack{
                Text("Daily High: \(stock.getMaxOfDay(), specifier: "%.2f")")
                    .fontWeight(.light)
                Text("Daily Low: \(stock.getMinOfDay(), specifier: "%.2f")")
                    .fontWeight(.light)
            }
            Divider()
            HStack{
                Text("52 Week High: \(stock.getMaxOfYear(), specifier: "%.2f")")
                    .fontWeight(.light)
                Text("52 Week Low: \(stock.getMinOfYear(), specifier: "%.2f")")
                    .fontWeight(.light)
            }
            Spacer()
        }
    }
}

struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        StockView(stock: StockData(name: "Hugh G. Sachs", delta: 420.68, shares: 68.9))
    }
}
