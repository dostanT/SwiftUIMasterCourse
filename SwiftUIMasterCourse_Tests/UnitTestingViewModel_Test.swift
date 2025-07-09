//
//  UnitTestingViewModel_Test.swift
//  SwiftUIMasterCourse_Tests
//
//  Created by Dostan Turlybek on 07.07.2025.
//

import XCTest
@testable import SwiftUIMasterCourse
import Combine


//Naming Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
//Naming Structure: test_[struct or class]_[variable or function]_[expected result]

//Testin Structure: Given, When, Then

final class UnitTestingViewModel_Test: XCTestCase {
    
    var viewModel: UnitTestingViewModel?
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func test_UnitTestingViewModel_isPremium_shouldBeTrue() {
        //given
        let userIsPremium: Bool = true
        
        //when
        let vm = UnitTestingViewModel(isPremium: userIsPremium)
        
        //then
        XCTAssertTrue(vm.isPremium)
    }
    
    func test_UnitTestingViewModel_isPremium_shouldBeFalse() {
        //given
        let userIsPremium: Bool = false
        
        //when
        let vm = UnitTestingViewModel(isPremium: userIsPremium)
        
        //then
        XCTAssertFalse(vm.isPremium)
    }
    
    func test_UnitTestingViewModel_isPremium_shouldBeInjectedValue() {
        //given
        let userIsPremium: Bool = Bool.random()
        
        //when
        let vm = UnitTestingViewModel(isPremium: userIsPremium)
        
        //then
        XCTAssertEqual(vm.isPremium, userIsPremium)
    }
    
    func test_UnitTestingViewModel_isPremium_shouldBeInjectedValue_stress() {
        for _ in 0..<10 {//тут можно тестить больше что бы проверить все кейсы если тип не бул
            //given
            let userIsPremium: Bool = Bool.random()
            
            //when
            let vm = UnitTestingViewModel(isPremium: userIsPremium)
            
            //then
            XCTAssertEqual(vm.isPremium, userIsPremium)
        }
    }
    
    func test_UnitTestingViewModel_dataArray_shouldBeEmpty() {
        //given
        
        //when
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        
        //then
        XCTAssertTrue(vm.dataArray.isEmpty)
    }
    
    func test_UnitTestingViewModel_dataArray_shouldAddItems() {
        //given
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        
        //when
        vm.addItem(item: "Hello")
        
        //then
        XCTAssertTrue(!vm.dataArray.isEmpty)
        XCTAssertFalse(vm.dataArray.isEmpty)
//        XCTAssertEqual(vm.dataArray.count, loopCount)
        XCTAssertNotEqual(vm.dataArray.count, 0)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
        // XCTAssertGreaterThanOrEqual
        // XCTAssertLessThan
        // XCTAssertLessThanOrEqual
    }
    
    func test_UnitTestingViewModel_dataArray_shouldNotAddBlankString() {
        //given
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        
        //when
        vm.addItem(item: "")
        
        //then
        XCTAssertTrue(vm.dataArray.isEmpty)
    }
    
    func test_UnitTestingViewModel_selectedItem_shouldStartAsNil() {
        //given
        
        //when
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        
        //then
        XCTAssertTrue(vm.selectedItem == nil)
        XCTAssertNil(vm.selectedItem)
    }
    
    func test_UnitTestingViewModel_selectedItem_shouldBeNilWhen() {
        //given
        
        //when
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        
        //then
        XCTAssertTrue(vm.selectedItem == nil)
        XCTAssertNil(vm.selectedItem)
    }
    
    func test_UnitTestingBootcampViewModel_selectedItem_shouldBeNilWhenSelectingInvalidItem() {
        // Given
        let vm = UnitTestingViewModel(isPremium: Bool.random())

        // When
        
        // select valid item
        let newItem = UUID().uuidString
        vm.addItem(item: newItem)
        vm.selectItem(item: newItem)

        // select invalid item
        vm.selectItem(item: UUID().uuidString)

        // Then
        XCTAssertNil(vm.selectedItem)
    }
    
    func test_UnitTestingBootcampViewModel_selectedItem_shouldBeSelected() {
        // Given
        let vm = UnitTestingViewModel(isPremium: Bool.random())

        // When
        let newItem = UUID().uuidString
        vm.addItem(item: newItem)
        vm.selectItem(item: newItem)

        // Then
        XCTAssertNotNil(vm.selectedItem)
        XCTAssertEqual(vm.selectedItem, newItem)
    }
    
    func test_UnitTestingBootcampViewModel_selectedItem_shouldBeSelected_stress() {
        // Given
        let vm = UnitTestingViewModel(isPremium: Bool.random())

        // When
        let loopCount: Int = Int.random(in: 1..<100)
        var itemsArray: [String] = []
        
        for _ in 0..<loopCount {
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            itemsArray.append(newItem)
        }
        
        let randomItem = itemsArray.randomElement() ?? ""
        XCTAssertFalse(randomItem.isEmpty)
        vm.selectItem(item: randomItem)

        // Then
        XCTAssertNotNil(vm.selectedItem)
        XCTAssertEqual(vm.selectedItem, randomItem)
    }
    
    func test_UnitTestingBootcampViewModel_saveItem_shouldThrowError_noData() {
        // Given
        let vm = UnitTestingViewModel(isPremium: Bool.random())

        // When
        

        // Then
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString))
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString), "Should throw Item Not Found error!") { error in
            let returnedError = error as? UnitTestingViewModel.DataError
            XCTAssertEqual(returnedError, UnitTestingViewModel.DataError.itemNotFound)
        }
    }
    
    func test_UnitTestingBootcampViewModel_downloadWithCombine_shouldReturnItems() {
        // Given
        let vm = UnitTestingViewModel(isPremium: Bool.random())

        // When
        let expectation = XCTestExpectation(description: "Should return items after a second.")
        
        vm.$dataArray
            .dropFirst()//это как continue in loop. Используется для того что бы не брать пустое значения так как мы его инициализировали через инит. Иницализация таголит этот сабскарйбер.
            .sink { returnedItems in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        vm.downloadWithCombine()
                
        // Then
        wait(for: [expectation], timeout: 5)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }
}
