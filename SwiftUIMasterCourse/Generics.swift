//
//  Generics.swift
//  SwiftUIMasterCourse
//
//  Created by Dostan Turlybek on 01.07.2025.
//
import SwiftUI

struct StringModel {
    
    let info: String?
    
    func removeInfo() -> StringModel {
        StringModel(info: nil)
    }
    
}

struct BoolModel {
    let info: Bool?
    
    func removeInfo() -> BoolModel {
        BoolModel(info: nil)
    }
}

struct GenericModel<T> {
    let info: T?
    func removeInfo() -> GenericModel {
        GenericModel(info: nil)
    }
}

class GenericsViewModel: ObservableObject {
//    @Published var data: [String] = []
//    
//    init() {
//        data = ["one", "two", "three"]
//    }
//    
//    func removeData() {
//        data.removeAll()
//    }
    
    @Published var stringModel = StringModel(info: "My data")
    @Published var boolModel = BoolModel(info: false)
    
    @Published var genericStringModel = GenericModel(info: "Hello")
    @Published var genericBoolModel = GenericModel(info: true)
    
    func removeData() {
        stringModel = stringModel.removeInfo()
        boolModel = boolModel.removeInfo()
        genericStringModel = genericStringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
    }
    
}

struct GenericsView: View {
    
    @StateObject private var viewModel = GenericsViewModel()
    
    var body: some View{
        VStack{
            Generic2View(content: Text("1"), title: "2")
//            ForEach(viewModel.data, id: \.self){item in
//                Text(item)
//                    .onTapGesture {
//                        viewModel.removeData()
//                    }
//            }
            Text(viewModel.stringModel.info ?? "no data")
            Text(viewModel.boolModel.info?.description ?? "no data")
            Text(viewModel.genericStringModel.info ?? "no data")
            Text(viewModel.genericBoolModel.info?.description ?? "no data")
                
        }
        .onTapGesture {
            viewModel.removeData()
        }
    }
}

struct Generic2View<T:View>: View {
    
    let content: T
    let title: String
    
    var body: some View {
        VStack{
            Text(title)
            content
        }
    }
}
