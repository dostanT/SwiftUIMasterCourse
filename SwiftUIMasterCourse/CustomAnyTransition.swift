//
//  CustomAnyTransition.swift
//  SwiftUIMasterCourse
//
//  Created by Dostan Turlybek on 30.06.2025.
//
import SwiftUI

struct RotateViewModifier: ViewModifier {
    
    let rotation: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(
                x: rotation != 0 ? UIScreen.main.bounds.width : 0,
                y: rotation != 0 ? UIScreen.main.bounds.height : 0)
    }
}

extension AnyTransition{
    static var rotating: AnyTransition {
        return AnyTransition.modifier(active: RotateViewModifier(rotation: 360), identity: RotateViewModifier(rotation: 0))
    }
    
    static func rotating(amount: Double) -> AnyTransition {
        return AnyTransition.modifier(active: RotateViewModifier(rotation: amount), identity: RotateViewModifier(rotation: 0))
    }
    
    static var rotatingOn: AnyTransition {
        return AnyTransition.asymmetric(
            insertion: .rotating(amount: 180),
            removal: .move(edge: .leading))
    }
}

struct CustomAnyTransition: View {
    
    @State private var showRectangle: Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            
            if showRectangle{
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.red)
                    .frame(width: 250, height: 350)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .transition(AnyTransition.rotating.animation(.easeInOut))
//                    .transition(.rotating(amount: 180))
                    .transition(.rotatingOn)
            }
            Spacer()
            
            Text("Click Me")
                .withDefaultButtonStyle(color: .blue)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showRectangle.toggle()
                    }
                }
        }
    }
}

struct CustomAnyTransition_Previews: PreviewProvider {
    static var previews: some View {
        CustomAnyTransition()
    }
}
