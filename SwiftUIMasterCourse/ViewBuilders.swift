//
//  ViewBuilders.swift
//  SwiftUIMasterCourse
//
//  Created by Dostan Turlybek on 02.07.2025.
//

import SwiftUI

struct HeaderViewRegular: View {
    
    let title: String
    let description: String?
    let iconName: String?
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            if let description = description {
                Text(description)
                    .font(.callout)
            }
            
            if let iconName = iconName{
                Image(systemName: iconName)
            }
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 5)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct HeaderViewGeneric<Content1: View, Content2: View>: View {
    let title: String
    let content: Content1
    let secondContent: Content2
    
    init(title: String,
         @ViewBuilder content: () -> Content1,
         @ViewBuilder secondContent: () -> Content2) {
        self.title = title
        self.content = content()
        self.secondContent = secondContent()
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            content
            secondContent
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 5)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct CustomHStack<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack{
            content
        }
    }
}

struct LocalViewBuilder: View {
    
    enum ViewType {
        case one, two, three
    }
    
    let type: ViewType
    
    var body: some View {
        VStack{
            headerSection
        }
    }
    
    @ViewBuilder private var headerSection: some View {
        if type == .one {
            viewOne
        } else if type == .two {
            viewTwo
        } else if type == .three {
            viewThree
        }
    } //instead to pass all this code to Hstack
    
    private var viewOne: some View {
        Text("One")
    }
    private var viewTwo: some View {
        VStack{
            Text("Two")
            Image(systemName: "heart.fill")
        }
    }
    private var viewThree: some View {
        Image(systemName: "heart.fill")
    }
}

struct ViewBuildersView: View {
    var body: some View {
        VStack{
            HeaderViewRegular(title: "Title", description: "Description", iconName: "heart.fill")
            
            HeaderViewGeneric(title: <#T##String#>) {
                Text("asdasd")
            } secondContent: {
                Text("adfsdfsdf")
            }

            Spacer()
        }
    }
}
