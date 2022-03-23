//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by 이시원 on 2022/03/18.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    
    func test_parse_return_type_Formula() {
        // given
        
        // when
        do {
            let result = try ExpressionParser.parse(from: "1 + 2 × -3") is Formula
            // then
            XCTAssertTrue(result)
        } catch {
            
        }
        
        
    }
    
    func test_parse에_1_플러스_2_곱하기_마이너스3_입력_parse의_result_return_마이너스9() {
        // given
        
        
        do {
            // when
            let result = try ExpressionParser.parse(from: "1 + 2 × -3").result()
            // then
            XCTAssertEqual(result, -9.0)
        } catch {
            
        }
        
    }
    
    func test_parse에_플러스_2_곱하기_마이너스3_입력_parse의_result_return_마이너스6() {
        // given
        do {
            // when
            let result = try ExpressionParser.parse(from: " + 2 × -3").result()
            
            // then
            XCTAssertEqual(result, -6.0)
        } catch {
            
        }
    }
    
    func test_parse에_1_플러스_2_나누기_0_입력_parse의_result_return_isNaN() {
        // given
        do {
            // when
            let result = try ExpressionParser.parse(from: "1 + 2 ÷ 0").result().isNaN
            
            // then
            XCTAssertTrue(result)
        } catch {
            
        }
    }
    
}
