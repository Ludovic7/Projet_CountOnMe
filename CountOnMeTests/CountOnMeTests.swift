//
//  CountOnMeTests.swift
//  CountOnMeTests
//
//  Created by Ludovic DANGLOT on 10/05/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CountOnMeTests: XCTestCase {
    
    var countModele : CountModele!
    
    override func setUp() {
        super.setUp()
        countModele = CountModele()
    }
    
    func testCountOnMeIsCalculated_CheckAdditionButton_TheResultIsTrue(){
        countModele.tappedNumberButton(numberText: "1")
        countModele.tappedAdditionButton()
        countModele.tappedNumberButton(numberText: "1")
        countModele.tappedEqualButton()
        
        XCTAssertEqual(countModele.calculText, "1 + 1 = 2")
    }
    
    func testCountOnMeIsCalculated_CheckSubstractionButton_TheResultIsTrue(){
        countModele.tappedNumberButton(numberText: "1")
        countModele.tappedSubstractionButton()
        countModele.tappedNumberButton(numberText: "2")
        countModele.tappedEqualButton()
        countModele.tappedEqualButton()
        
        XCTAssertEqual(countModele.calculText, "1 - 2 = -1")
    }
    
    func  testCountOnMeIsCalculated_CheckTappedNumberButton_TheResultIsTrue(){
        countModele.tappedNumberButton(numberText: "1")
        countModele.tappedNumberButton(numberText: "2")
        countModele.tappedNumberButton(numberText: "3")
        countModele.tappedNumberButton(numberText: "4")
        countModele.tappedNumberButton(numberText: "5")
        countModele.tappedNumberButton(numberText: "6")
        countModele.tappedNumberButton(numberText: "7")
        countModele.tappedNumberButton(numberText: "8")
        countModele.tappedNumberButton(numberText: "9")
        countModele.tappedNumberButton(numberText: "0")
        countModele.tappedNumberButton(numberText: "=")
        
        XCTAssertEqual(countModele.calculText, "1234567890=")
        
    }
    
    func testCountOnMeIsCalculated_CheckTappedEqualButton_TheResultIsTrue(){
        countModele.tappedEqualButton()
        
        XCTAssertEqual(countModele.expressionIsCorrect, true)
    }
    
    func testCountOnMeIsCalculated_CheckTappedButtonHaveResult_TheResultIsTrue(){
        countModele.tappedNumberButton(numberText: "1")
        countModele.tappedSubstractionButton()
        countModele.tappedNumberButton(numberText: "2")
        countModele.tappedEqualButton()
        countModele.tappedNumberButton(numberText: "2")
        
        XCTAssertEqual(countModele.calculText, "2")
    }

    func testCountOnMeIsCalculated_CheckAdditionButtonWarning_TheResultIsTrue(){
        countModele.tappedNumberButton(numberText: "1")
        countModele.tappedAdditionButton()
        countModele.tappedAdditionButton()
        
        XCTAssertEqual(countModele.calculText, "1 + ")
    }
    
    func testCountOnMeIsCalculated_CheckSubstractionButtonWarning_TheResultIsTrue(){
        countModele.tappedNumberButton(numberText: "1")
        countModele.tappedSubstractionButton()
        countModele.tappedSubstractionButton()
        
        XCTAssertEqual(countModele.calculText, "1 - ")
    }
    
    func testCountOnMeIsCalculated_CheckMultiplicationButtonWarning_TheResultIsTrue(){
        countModele.tappedNumberButton(numberText: "1")
        countModele.tappedMultiplicationButton()
        countModele.tappedMultiplicationButton()
        
        XCTAssertEqual(countModele.calculText, "1 x ")
    }
    
    func testCountOnMeIsCalculated_CheckDivisionButtonWarning_TheResultIsTrue(){
        countModele.tappedNumberButton(numberText: "1")
        countModele.tappedDivisionButton()
        countModele.tappedDivisionButton()
        
        XCTAssertEqual(countModele.calculText, "1 / ")
    }
    
    func testCountOnMeIsCalculated_CheckEqualButtonWarning_TheResultIsTrue(){
        countModele.tappedNumberButton(numberText: "1")
        countModele.tappedSubstractionButton()
        countModele.tappedEqualButton()
        
        XCTAssertEqual(countModele.calculText, "1 - ")
    }
    
    func testCountOnMeIsCalculated_CheckMultiplicationButton_TheResultIsTrue(){
        countModele.tappedNumberButton(numberText: "1")
        countModele.tappedMultiplicationButton()
        countModele.tappedNumberButton(numberText: "2")
        countModele.tappedEqualButton()
        countModele.tappedEqualButton()
        
        XCTAssertEqual(countModele.calculText, "1 x 2 = 2")
    }
    
    func testCountOnMeIsCalculated_CheckDivisionButton_TheResultIsTrue(){
        countModele.tappedNumberButton(numberText: "2")
        countModele.tappedDivisionButton()
        countModele.tappedNumberButton(numberText: "2")
        countModele.tappedEqualButton()
        countModele.tappedEqualButton()
        
        XCTAssertEqual(countModele.calculText, "2 / 2 = 1")
    }
    
    func testCountOnMeIsCalculated_CheckPrirityCalcul_TheResultIsTrue(){
        countModele.tappedNumberButton(numberText: "1")
        countModele.tappedAdditionButton()
        countModele.tappedNumberButton(numberText: "2")
        countModele.tappedMultiplicationButton()
        countModele.tappedNumberButton(numberText: "3")
        countModele.tappedDivisionButton()
        countModele.tappedNumberButton(numberText: "2")
        countModele.tappedEqualButton()
        
        XCTAssertEqual(countModele.calculText, "1 + 2 x 3 / 2 = 4")
    }
    
    func testCountOnMeIsCalculated_CheckDivisionBy0_TheResultIsTrue(){
        countModele.tappedNumberButton(numberText: "2")
        countModele.tappedDivisionButton()
        countModele.tappedNumberButton(numberText: "0")
        countModele.tappedEqualButton()
        countModele.tappedEqualButton()
        
        XCTAssertEqual(countModele.calculText, "2 / 0")
    }
    
    func testCountOnMeIsCalculated_CheckDivisionAfterCalcul_TheResultIsTrue(){
        countModele.tappedNumberButton(numberText: "2")
        countModele.tappedDivisionButton()
        countModele.tappedNumberButton(numberText: "2")
        countModele.tappedEqualButton()
        countModele.tappedDivisionButton()

        
        XCTAssertEqual(countModele.calculText, "2 / 2 = 1")
    }
    
    func testCountOnMeIsCalculated_CheckMultiplicationAfterCalcul_TheResultIsTrue(){
        countModele.tappedNumberButton(numberText: "2")
        countModele.tappedMultiplicationButton()
        countModele.tappedNumberButton(numberText: "2")
        countModele.tappedEqualButton()
        countModele.tappedMultiplicationButton()

        
        XCTAssertEqual(countModele.calculText, "2 x 2 = 4")
    }
    
    func testCountOnMeIsCalculated_CheckSubstractionAfterCalcul_TheResultIsTrue(){
        countModele.tappedNumberButton(numberText: "2")
        countModele.tappedMultiplicationButton()
        countModele.tappedNumberButton(numberText: "2")
        countModele.tappedEqualButton()
        countModele.tappedSubstractionButton()

        
        XCTAssertEqual(countModele.calculText, "2 x 2 = 4")
    }
    
    func testCountOnMeIsCalculated_CheckAdditionAfterCalcul_TheResultIsTrue(){
        countModele.tappedNumberButton(numberText: "2")
        countModele.tappedMultiplicationButton()
        countModele.tappedNumberButton(numberText: "2")
        countModele.tappedEqualButton()
        countModele.tappedAdditionButton()

        
        XCTAssertEqual(countModele.calculText, "2 x 2 = 4")
    }
    
    func testCountOnMeIsCalculated_CheckACButton_TheResultIsTrue(){
        countModele.tappedACButton()
        XCTAssertEqual(countModele.calculText, "")
    }
    
}
