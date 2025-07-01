//
//  AnimateCustomShape.swift
//  SwiftUIMasterCourse
//
//  Created by Dostan Turlybek on 01.07.2025.
//
import SwiftUI



struct AnimateCustomShape: View {
    
    @State private var animate: Bool = false
    
    var body: some View {
        ZStack{
            //RectangleWithSingleCornerAnimation(cornerRadius: animate ? 60 : 0)
            Pacman(offsetAmount: animate ? 40 : 0)
                .frame(width: 200, height: 200)
                .foregroundStyle(.yellow)
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 0.2).repeatForever()) {
                animate.toggle()
            }
        }
    }
}

struct RectangleWithSingleCornerAnimation: Shape {
    
    var cornerRadius: CGFloat = 60
    
    var animatableData: CGFloat{
        get { cornerRadius }
        set { cornerRadius = newValue }
    }
    
    nonisolated func path(in rect: CGRect) -> Path {
        Path{path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
            path.addArc(
                center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                radius: cornerRadius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 360),
                clockwise: false)
            path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct Pacman: Shape {
    
    var offsetAmount: CGFloat = 0
    
    var animatableData: CGFloat{
        get{ offsetAmount }
        set { offsetAmount = newValue }
    }
    
    nonisolated func path(in rect: CGRect) -> Path {
        Path{path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.minY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: offsetAmount),
                endAngle: Angle(degrees: 360 - offsetAmount),
                clockwise: false)
        }
    }
}

