//
//  CurrencyFormatterTest.swift
//  BankeyUnirTests
//
//  Created by Артем Орлов on 19.10.2022.
//

import XCTest

@testable import Bankey

class Test: XCTestCase {
    
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
        
    }
    
    func testShouldBeVisible() throws {
        let result = formatter.breakIntoDollarsAndCents(929466.23)
        XCTAssertEqual(result.0, "929,466")
        XCTAssertEqual(result.1, "23")
    }
    
    func testDollarsFormatted() throws {
        let results = formatter.dollarsFormatted(929466.23)
        XCTAssertEqual(results, "$929,466.23")
    }
    func testZeroDollarsFormatted() throws {
        let results = formatter.dollarsFormatted(0)
        XCTAssertEqual(results, "$0.00")
    }
    
    func testDollarsFormattedWithCurrencySymbok() throws {
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        
        let result = formatter.dollarsFormatted(929466.23)
        XCTAssertEqual(result, "\(currencySymbol)929,466.23")
    }

}
