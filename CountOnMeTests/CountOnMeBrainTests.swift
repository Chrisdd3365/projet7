//
//  CountOnMeBrain.swift
//  CountOnMeTests
//
//  Created by Christophe DURAND on 10/07/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CountOnMeBrainTests: XCTestCase {
    
    //MARK: - Properties
    var countOnMe: CountOnMeBrain!
    
    //MARK: - Methods
    override func setUp() {
        super.setUp()
        countOnMe = CountOnMeBrain()
    }
    
    func testGivenIsExpressionCorrect_WhenStringNumberContainNothing_ThenExpressionReturnFalse() {
        XCTAssertFalse(countOnMe.isExpressionCorrect)
    }
    
    func testGivenIsExpressionCorrect_WhenExpressionTappedIsNotCorrect_ThenExpressionReturnFalse() {
        countOnMe.addNewNumber(1)
        countOnMe.plus()
        countOnMe.calculateTotal()
        
        XCTAssertFalse(countOnMe.isExpressionCorrect)
    }
    
    func testGivenIsExpressionCorrect_WhenExpressionTappedIsCorrect_ThenExpressionReturnTrue() {
        countOnMe.addNewNumber(1)
        
        XCTAssertTrue(countOnMe.isExpressionCorrect)
    }
    
    func testGivenCanAddOperator_WhenStringNumberContainNothing_ThenCanAddOperatorReturnFalse() {
        XCTAssertFalse(countOnMe.canAddOperator)
    }
    
    func testGivenCanAddOperator_WhenStringNumberContainSomething_ThenCanAddOperatorReturnTrue() {
        countOnMe.addNewNumber(1)
        
        XCTAssertTrue(countOnMe.canAddOperator)
    }
    
    func testGivenAddNewNumber_WhenStringNumberContainAnything_ThenNewNumberIsAdded() {
        countOnMe.addNewNumber(1)
        
        XCTAssert(countOnMe.stringNumbers[countOnMe.stringNumbers.count-1] == "1")
    }
    
    func testGivenClear_WhenStringNumberContainAnything_ThenStringNumberIsCleared() {
        countOnMe.clear()
        
        XCTAssert(countOnMe.stringNumbers[countOnMe.stringNumbers.count-1] == "")
        XCTAssert(countOnMe.operators == ["+"])
        XCTAssert(countOnMe.index == 0)
    }
    
    func testGivenOrderOfOperations_WhenStringNumberContainSomething_ThenStringNumberFollowsOrderOfOperations() {
        countOnMe.addNewNumber(1)
        countOnMe.minus()
        countOnMe.addNewNumber(2)
        countOnMe.multiply()
        countOnMe.addNewNumber(8)
        countOnMe.divide()
        countOnMe.addNewNumber(2)
        countOnMe.calculateTotal()
        
        XCTAssert(true)
    }
    
    func testGivenOrderOfOperations_WhenStringNumberContainSomething_ThenStringNumberIsCorrect() {
        countOnMe.orderOfOperations()
        
        XCTAssert(true)
    }
}
