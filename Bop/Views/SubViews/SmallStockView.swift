//
//  SmallStockView.swift
//  Bop
//
//  Created by Justin Hurley on 2/26/21.
//

import SwiftUI

//class for the smallStock object
class SmallStock{
    var name: String = ""
    var numShares: Float = 0.0
    var delta: Float = 0.0
    
    init(name: String, numShares: Float, delta: Float){
        self.name = name
        self.numShares = numShares
        self.delta = delta
    }
}

//handles the smaller stock view that shows individual stocks in a users portfolio, as of now it has:
//artist name, price change (delta), shares owned
struct SmallStockView: View {
    var smallStock: SmallStock
    var body: some View {
        HStack{
            //Left elements
            VStack(alignment: .leading){
                Text(smallStock.name)
                Text("Shares: \(smallStock.numShares, specifier: "%.1f")")
                    .fontWeight(.light)
                    .font(.system(size: 15))
            }
            Spacer()
            //logic handles color for stock change box
            if(smallStock.delta >= 0){
                Text("+\(smallStock.delta,specifier: "%.2f")")
                    .padding(.trailing, 6.0)
                    .frame(width: 90, height: 30, alignment: .trailing)
                    .background(RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.green))
            }
            else{
                Text("\(smallStock.delta,specifier: "%.2f")")
                    .padding(.trailing, 6.0)
                    .frame(width: 90, height: 30, alignment: .trailing)
                    .background(RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.red))
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .clipped()
    }
}

struct SmallStockView_Previews: PreviewProvider {
    static var previews: some View {
        SmallStockView(smallStock: SmallStock(name: "Obama", numShares: 44, delta: 2012))
    }
}
