//
//  ViewModifierFile.swift
//  SwiftUIMasterCourse
//
//  Created by Dostan Turlybek on 29.06.2025.
//
import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
         content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 5)
            .padding()
    }
}

extension View {
    
    func withDefaultButtonStyle(color: Color) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: color))
    }
    
}

struct ViewModifierFileView: View {
    var body: some View {
        VStack{
            Text("Hello world")
//                .font(.headline)
//                .foregroundColor(.white)
//                .frame(height: 55)
//                .frame(maxWidth: .infinity)
//                .background(.blue)
//                .clipShape(RoundedRectangle(cornerRadius: 20))
//                .shadow(radius: 5)
//                .padding()
            
//                .modifier(DefaultButtonViewModifier())
                .withDefaultButtonStyle(color: .red)
        }
    }
}

struct ViewModifierFileView_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierFileView()
    }
}
