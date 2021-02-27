//
//  StockView.swift
//  Bop
//
//  Created by Justin Hurley on 2/26/21.
//

import SwiftUI

//general class for a stock
class Stock{
    var name: String = ""
    var delta: Float = 0.0
    
    init(name: String, delta: Float){
        self.name = name
        self.delta = delta
    }
}

struct StockView: View {
    var stock : Stock
    var body: some View {
        NavigationView{
            LineView(data: [1,3,2,5,4,7,6,9,8])
        }
        .navigationTitle(stock.name)
    }
}

struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        StockView(stock: Stock(name: "Obama", delta: 420.69))
    }
}
