//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 이호영 on 2021/11/09.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    var queue: CalculatorItemQueue = CalculatorItemQueue()
    
    func testQueueListisnotEmpty() {
        XCTAssertEqual(convertList(list: queue.queueList).isEmpty, true)
    }
    
    func testQueueListappend() {
        queue.append(item: NumberItem(data: 1))
        
        XCTAssertEqual(convertList(list: queue.queueList), ["1"])
    }
    
    func testQueueSort() {
        queue.append(item: NumberItem(data: 2))
        queue.append(item: NumberItem(data: 1))

        XCTAssertEqual(convertList(list: queue.queueList), ["2","1"])
    }
    
    func testQueueAppendnil() {
        queue.append(item: nil)
        
        XCTAssertEqual(convertList(list: queue.queueList), [])
    }
    
    func testQueueRemove() {
        
        guard let removedItem = queue.remove() else {
            return
        }
        var data = ""
        if let number = removedItem as? NumberItem {
            data = number.dataToString
        }
        
        XCTAssertEqual(data, "1")
    }
    
    func testEmptyQueueRemove() {
        let data1 = queue.remove()
        let data2 = queue.remove()
        
        var data: String?
        if let number = data2 as? NumberItem {
            data = number.dataToString
        }
        
        XCTAssertEqual(data, nil)
    }
    
    func testQueueListClear() {
        queue.clearList()
        
        XCTAssertEqual(convertList(list: queue.queueList), [])
    }
    
    func testQueueListappendOperatorItem() {
        queue.append(item: OperatorItem.add)
        
        XCTAssertEqual(convertList(list: queue.queueList), ["+"])
    }
    
    func testQueueListAppendOperatorAndNumber() {
        queue.append(item: OperatorItem.add)
        queue.append(item: OperatorItem.divide)
        queue.append(item: NumberItem(data: 2))
        
        XCTAssertEqual(convertList(list: queue.queueList), ["+","/","2"])
    }
    
    func testCalculatorQueueInit() {
        let queue: CalculatorItemQueue = CalculatorItemQueue(queueList: [NumberItem(data: 3)])
        
        XCTAssertEqual(convertList(list: queue.queueList), ["3"])
    }
    
    func testAnotherCalculatorQueueInit() {
        var calculatorQueue: CalculatorItemQueue = CalculatorItemQueue(queueList: [NumberItem(data: 3)])
        var preparedCalculatorQueue: CalculatorItemQueue = CalculatorItemQueue()
        
        calculatorQueue.append(item: OperatorItem.add)
        preparedCalculatorQueue.append(item: NumberItem(data: 3))
        
        XCTAssertEqual(convertList(list: calculatorQueue.queueList), ["3","+"])
        XCTAssertEqual(convertList(list: preparedCalculatorQueue.queueList), ["3"])
    }
    
    func convertList(list: [CalcultorItem]) -> [String] {
        var compareList:[String] = []
        for item in list {
            if let number = item as? NumberItem {
                compareList.append(number.dataToString)
            }
            if let operatorItem = item as? OperatorItem {
                compareList.append(operatorItem.description)
            }
        }
        return compareList
    }
}
