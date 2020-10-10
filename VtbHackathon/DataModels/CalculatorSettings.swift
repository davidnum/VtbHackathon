//
//  CalculatorSettings.swift
//  VtbHackathon
//
//  Created by David Num on 11.10.2020.
//

import Foundation

struct CalculatorSettings: Decodable {
    let clientTypes: [String]
    let specialConditions: [SpecialCondition]
    let variant: CalculatorVariant
    let cost: Int
    let initialFee: Int
}
