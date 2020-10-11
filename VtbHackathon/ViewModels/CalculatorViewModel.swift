//
//  CalculatorViewModel.swift
//  VtbHackathon
//
//  Created by David Num on 11.10.2020.
//

import Foundation

class CalculatorViewModel: ObservableObject {
    @Published var loading: Bool = false
    
    @Published var specialConditions: [SpecialCondition] = []
    @Published var selectedSpecialConditions: [String] = []
    @Published var initialFee: String = ""
    @Published var cost: Int = 0
    @Published var term: Double = 5

    
    // residualPayment
    // settingsName
    // language
    // kaskoValue

}
