//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by Raj Mahajan on 28/08/24.
//

import Foundation

enum TipCalculatorError: Error {
    case invalidInput
}
class TipCalculator {
    func calculate(total: Double, tipPercetage: Double) throws -> Double {
        if total < 0 {
            throw TipCalculatorError.invalidInput
        }
        return total * tipPercetage
    }
}
