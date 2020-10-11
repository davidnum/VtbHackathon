//
//  CalculatorResult.swift
//  VtbHackathon
//
//  Created by David Num on 11.10.2020.
//

import Foundation

struct CalculatorResult: Decodable {
    let contractRate: Double
    let loanAmount: Double
    let payment: Double
}
