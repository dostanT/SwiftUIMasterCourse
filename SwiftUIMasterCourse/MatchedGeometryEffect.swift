//
//  MatchedGeometryEffect.swift
//  SwiftUIMasterCourse
//
//  Created by Dostan Turlybek on 30.06.2025.
//

import SwiftUI

//modifiers нужно менять местами если есть лаги. Потому что некоторые требуют точную Иреархию что не было лагов в анимации

struct MatchedGeometryEffect: View {
    
    @State private var isClicked: Bool = false
    @Namespace private var namespace
    
    var body: some View {
        VStack{
            if !isClicked {
                Circle()
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 100, height: 100)
    //                .offset(y: isClicked ? 0 : UIScreen.main.bounds.height)
            }
            Spacer()
            
            if isClicked{
                Circle()
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 300, height: 200)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
            }
        }
    }
}

struct MatchedGeometryEffect_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffect()
    }
}

struct MatchedGeometryEffect2: View {
    let categories: [String] = ["Home", "Popular", "Saved"]
    
    @State private var selected: String = ""
    @Namespace private var namespace
    
    var body: some View{
        HStack{
            ForEach(categories, id: \.self) { category in
                ZStack(alignment: .bottom){
                    if selected == category{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.red.opacity(0.5))
                            .matchedGeometryEffect(id: "category_background", in: namespace)
                            .frame(width: 35, height: 2)
                            .offset(y: 10)
                    }
                    
                    Text(category)
                        .foregroundStyle(selected == category ? .red : .black)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring()){
                        selected = category
                    }
                }
            }
        }
        .padding()
    }
}
