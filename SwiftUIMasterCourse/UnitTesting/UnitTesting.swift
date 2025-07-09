//
//  UnitTesting.swift
//  SwiftUIMasterCourse
//
//  Created by Dostan Turlybek on 07.07.2025.
//

import SwiftUI

/*
 1. Unit Tests
 - test the business logic in your app
 
 2. UI Tests
 - tests the UI of your app
 */

struct UnitTesting: View {
    
    @StateObject private var vm: UnitTestingViewModel
    
    init(isPremium: Bool) {
        _vm = StateObject(wrappedValue: UnitTestingViewModel(isPremium: isPremium))
    }
    
    var body: some View {
        Text(vm.isPremium.description)
    }
}

struct UnitTesting_previews: PreviewProvider {
    static var previews: some View {
        UnitTesting(isPremium: true)
    }
}

