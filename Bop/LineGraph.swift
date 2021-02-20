//
//  LineGraph.swift
//  Bop
//
//  Created by Justin Hurley on 2/19/21.
//

import SwiftUI

struct LineGraph: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 100, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
        }.fill(Color.green)
    }
}

struct LineGraph_Previews: PreviewProvider {
    static var previews: some View {
        LineGraph()
    }
}
