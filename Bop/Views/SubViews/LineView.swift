//
//  LineView.swift
//  Bop
//
//  Created by Justin Hurley on 2/22/21.
//

import SwiftUI

struct LineView: View {
    var data: [Double]
    var title: String?
    var price: String?
    var lineWidth: Int

    public init(data: [Double],
                title: String? = nil,
                price: String? = nil, lineWidth: Int) {
        self.data = data
        self.title = title
        self.price = price
        self.lineWidth = lineWidth
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            GeometryReader{ reader in
                Line(data: self.data,
                     frame: .constant(CGRect(x: 0, y: 0, width: reader.size.width , height: reader.size.height)),
                     lineWidth: lineWidth
                )
            }
        }
    }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        //dummy data that shows up in the preview screen
        LineView(data: [8,23,54,32,12,37,7,23,43], title: "Full chart", lineWidth: 3)
    }
}

struct Line: View {
    var data: [(Double)]
    @Binding var frame: CGRect
    var lineWidth : Int
    let padding:CGFloat = 30
    
    var stepWidth: CGFloat {
        //if dataset is too small to make a graph, return zero else, return the step width
        if data.count < 2 {
            return 0
        }
        return frame.size.width / CGFloat(data.count-1)
    }
    //determines the step height
    var stepHeight: CGFloat {
        var min: Double?
        var max: Double?
        let points = self.data
        //gets min and max of current data set
        if let minPoint = points.min(), let maxPoint = points.max(), minPoint != maxPoint {
            min = minPoint
            max = maxPoint
        }else {
            return 0
        }
        //determines if we need to deal with negative numbers
        if let min = min, let max = max, min != max {
            if (min <= 0){
                return (frame.size.height) / CGFloat(max - min)
            }else{
                return (frame.size.height) / CGFloat(max + min)
            }
        }
        return 0
    }
    //builds path with the given data and calculated width and height
    var path: Path {
        let points = self.data
        return Path.lineChart(points: points, step: CGPoint(x: stepWidth, y: stepHeight))
    }
    
    public var body: some View {
        //method variables and if statement to determine if line should be red or green based on difference in interval given
        let points = self.data
        var green = true
        let first = points.first ?? 0
        let last = points.last ?? 0
        if(last < first){
            green = false
        }
        let lineWidth = self.lineWidth
        return ZStack {
            if green {
                self.path
                    .stroke(Color.green ,style: StrokeStyle(lineWidth: CGFloat(lineWidth), lineJoin: .round))
                    .rotationEffect(.degrees(180), anchor: .center)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .drawingGroup()
            }
            else{
                self.path
                    .stroke(Color.red ,style: StrokeStyle(lineWidth: CGFloat(lineWidth), lineJoin: .round))
                    .rotationEffect(.degrees(180), anchor: .center)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .drawingGroup()
            }
                
        }
    }
}

extension Path {
    static func lineChart(points:[Double], step:CGPoint) -> Path {
        var path = Path()
        if (points.count < 2){
            return path
        }
//        guard let offset = points.min() else { return path }
        let p1 = CGPoint(x: 0, y: CGFloat(points[0])*step.y)
        path.move(to: p1)
        for pointIndex in 1..<points.count {
            let p2 = CGPoint(x: step.x * CGFloat(pointIndex), y: step.y*CGFloat(points[pointIndex]))
            path.addLine(to: p2)
        }
        return path
    }
}
