//
//  PreferenceKey.swift
//  SwiftUIMasterCourse
//
//  Created by Dostan Turlybek on 02.07.2025.
//
import SwiftUI

struct PreferenceKeyView: View {
    
    @State private var text: String = "Hello"
    
    var body: some View {
        NavigationStack{
            VStack{
                SecondView(text: text)
                    .navigationTitle("Navigation Title")
//                    .preference(key: CustomTitlePreferenceKey.self, value: "NewValue")
            }
            
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self) { value in
            self.text = value
        }
    }
}

extension View {
    func customTitle(_ text: String) -> some View {
        preference(key: CustomTitlePreferenceKey.self, value: text)
    }
}

struct SecondView: View {
    
    let text: String
    @State private var newValue: String = ""
    
    var body: some View {
        Text(text)
//            .preference(key: CustomTitlePreferenceKey.self, value: "NewValue")
//            .customTitle("New Second Value")
            .onAppear {
                getDataFromDataBase()
            }
            .customTitle(newValue)
    }
    
    func getDataFromDataBase() {
        //download fake data
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            self.newValue = "New value"
        })
    }
}

struct CustomTitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}
