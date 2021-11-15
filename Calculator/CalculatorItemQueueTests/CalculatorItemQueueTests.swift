//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Seul Mac on 2021/11/09.
//

import XCTest

class CalculatorItemQueueTests: XCTestCase {

    func test_연산자_inbox가_비어있는지() {
        let formula = Formula()
        XCTAssertTrue(formula.operands.inbox.isEmpty)
    }
    
    func test_숫자_inbox가_비어있는지() {
        let formula = Formula()
        XCTAssertTrue(formula.operators.inbox.isEmpty)
    }
    
    func test_연산자_outbox가_비어있는지() {
        let formula = Formula()
        XCTAssertTrue(formula.operators.outbox.isEmpty)
    }
    
    func test_숫자_outbox가_비어있는지() {
        let formula = Formula()
        XCTAssertTrue(formula.operands.outbox.isEmpty)
    }
    
    func test_연산자_inbox에_add추가() {
        var formula = Formula()
        formula.operators.enqueue(.add)
        XCTAssertEqual(formula.operators.inbox, [.add])
    }
    
    func test_연산자_inbox에_add_multiply_추가() {
        var formula = Formula()
        formula.operators.enqueue(.add)
        formula.operators.enqueue(.multiply)
        XCTAssertEqual(formula.operators.inbox, [.add, .multiply])
    }
    
    func test_연산자_inbox에_add_multiply_추가_첫번째_요소_제거_및_확인() {
        var formula = Formula()
        formula.operators.enqueue(.add)
        formula.operators.enqueue(.multiply)
        let result = formula.operators.dequeue()
        XCTAssertEqual(result, .add)
    }
    
    func test_숫자_inbox에_123추가() {
        var formula = Formula()
        formula.operands.enqueue(123)
        XCTAssertEqual(formula.operands.inbox, [123])
    }
    
    func test_숫자_inbox에_123_124_추가() {
        var formula = Formula()
        formula.operands.enqueue(123)
        formula.operands.enqueue(124)
        XCTAssertEqual(formula.operands.inbox, [123, 124])
    }
    
    func test_숫자_inbox에_123_124_추가_첫번째_요소_제거_및_확인() {
        var formula = Formula()
        formula.operands.enqueue(123)
        formula.operands.enqueue(124)
        let result = formula.operands.dequeue()
        XCTAssertEqual(result, 123)
    }
    
    func test_숫자_inbox에_1_dot_23_추가() {
        var formula = Formula()
        formula.operands.enqueue(1.23)
        XCTAssertEqual(formula.operands.inbox, [1.23])
    }
    
    func test_숫자_inbox에_1_dot_23_1_dot_24_추가() {
        var formula = Formula()
        formula.operands.enqueue(1.23)
        formula.operands.enqueue(1.24)
        XCTAssertEqual(formula.operands.inbox, [1.23, 1.24])
    }
    
    func test_숫자_inbox에_1_dot_23_1_dot_24_추가_첫번째_요소_제거_및_확인() {
        var formula = Formula()
        formula.operands.enqueue(1.23)
        formula.operands.enqueue(1.24)
        let result = formula.operands.dequeue()
        XCTAssertEqual(result, 1.23)
    }
    
    func test_숫자_inbox에_1_dot_23_124_추가() {
        var formula = Formula()
        formula.operands.enqueue(1.23)
        formula.operands.enqueue(124)
        XCTAssertEqual(formula.operands.inbox, [1.23, 124])
    }
    
    func test_숫자_inbox에_123_1_dot_24_추가_첫번째_요소_제거_및_확인() {
        var formula = Formula()
        formula.operands.enqueue(123)
        formula.operands.enqueue(1.24)
        let result = formula.operands.dequeue()
        XCTAssertEqual(result, 123)
    }
    
    func test_숫자_inbox에_음수_1_dot_23_124_추가() {
        var formula = Formula()
        formula.operands.enqueue(-1.23)
        formula.operands.enqueue(124)
        XCTAssertEqual(formula.operands.inbox, [-1.23, 124])
    }
    
    func test_숫자_inbox에_음수_123_1_dot_24_추가_첫번째_요소_제거_및_확인() {
        var formula = Formula()
        formula.operands.enqueue(-123)
        formula.operands.enqueue(1.24)
        let result = formula.operands.dequeue()
        XCTAssertEqual(result, -123)
    }
    
    func test_연산자_queue가_비어있을때_dequeue시_nil_반환() {
        var formula = Formula()
        let result = formula.operators.dequeue()
        XCTAssertNil(result)
    }
    
    func test_숫자_queue가_비어있을때_dequeue시_nil_반환() {
        var formula = Formula()
        let result = formula.operators.dequeue()
        XCTAssertNil(result)
    }

}