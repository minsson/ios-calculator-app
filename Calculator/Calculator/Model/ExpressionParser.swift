//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/10.
//

import Foundation

enum ExpressionParser {
    static let operatorSet = Operator.allCases.map { String($0.rawValue) }
    
    static func parse(from input: String) -> Formula {
        var operandsQueue = CalculatorItemQueue<Double>()
        var operatorsQueue = CalculatorItemQueue<Operator>()
        
        let operands = componentsByOperators(from: input)
        let operators = input.split(with: " ")
                .filter { operatorSet.contains($0) }
                .compactMap { Operator(rawValue: Character($0)) }

        operands.forEach { operandsQueue.enqueue($0) }
        operators.forEach { operatorsQueue.enqueue($0) }

        return Formula(operands: operandsQueue, operators: operatorsQueue)
    }
    
    private static func componentsByOperators(from input: String) -> [Double] {
        let result = input.split(with: " ")

        return result.compactMap { Double($0) }
    }
    
    private static func convertToDouble(from string: String) -> Double? {
        guard let result = Double(string) else {
            return nil
        }
        
        return result
    }
}
