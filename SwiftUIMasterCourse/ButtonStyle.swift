//
//  ButtonStyle.swift
//  SwiftUIMasterCourse
//
//  Created by Dostan Turlybek on 30.06.2025.
//
import SwiftUI

struct PresseButtonStyle: ButtonStyle {
    
    let color: Color
    let backgroundColor: Color
    
    init(color: Color, backgroundColor: Color) {
        self.color = color
        self.backgroundColor = backgroundColor
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.headline)
            .foregroundStyle(color)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 10)
            .brightness(configuration.isPressed ? 0.05 : 0)
    }
}

extension View {
    func withPressableStyle(color: Color, backgroundColor: Color) -> some View {
        buttonStyle(PresseButtonStyle(color: color, backgroundColor: backgroundColor))
    }
}

struct ButtonStyleView: View {
    var body: some View {
        Button{
            print("pressed")
        } label: {
            Text("Click me")
        }
        .withPressableStyle(color: .white, backgroundColor: .blue)
        .padding()
    }
}

struct ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleView()
    }
}
