import Foundation

extension Double: CalculateItem {
    
}

extension String {
    func split(with target: Character) -> [String] {
        let splitedString = self.split(separator: target).map { String($0) }
        return splitedString
    }
    
    func insertComma() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp
        numberFormatter.maximumSignificantDigits = 20
        
        let splitByDecimalPoint = self.split(with: ".")
        guard let dobleTypeInteger = Double(splitByDecimalPoint[0]) else {
            return ""
        }
        
        let valueWithComma: String
        guard let integerWithComma = numberFormatter.string(from: NSNumber(value: dobleTypeInteger)) else {
            return ""
        }
        
        if splitByDecimalPoint.count == 2 {
          let decimalValue = splitByDecimalPoint[1]
            valueWithComma = integerWithComma + "." + decimalValue
        } else if splitByDecimalPoint.count == 1 && self.contains(".") {
            valueWithComma = integerWithComma + "."
        } else {
            valueWithComma = integerWithComma
        }
        
        return valueWithComma
    }
}
