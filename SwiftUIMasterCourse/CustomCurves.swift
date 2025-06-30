//
//  CustomCurves.swift
//  SwiftUIMasterCourse
//
//  Created by Dostan Turlybek on 30.06.2025.
//

import SwiftUI

struct ArcSample: Shape{
    nonisolated func path(in rect: CGRect) -> Path {
        Path{path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 360),
                clockwise: false
            )
        }
    }
}

struct ShapeWithArc: Shape{
    nonisolated func path(in rect: CGRect) -> Path {
        Path{path in
            //top left
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            
            //top right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
            //mid right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            
            //bottom
//            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY - rect.height / 5),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 180),
                clockwise: false
            )
            
            //mid left
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            
        }
    }
}

struct QuadSample: Shape{
    nonisolated func path(in rect: CGRect) -> Path {
        Path{ path in
            path.move(to: .zero)
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.maxY),
                control: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct WaterShape: Shape {
    nonisolated func path(in rect: CGRect) -> Path {
        Path{path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.midX, y: rect.midY),
                control: CGPoint(x: rect.width * 0.45, y: rect.height * 0.45)
            )
            
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.midY),
                control: CGPoint(x: rect.width * 0.60, y: rect.height * 0.60)
            )
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            
        }
    }
}

struct CustomCurves: View {
    var body: some View {
        //its like background
        WaterShape()
            .frame(width: 200, height: 200)
    }
}
