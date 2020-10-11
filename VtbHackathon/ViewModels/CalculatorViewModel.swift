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
    
    @Published var result: CalculatorResult?
    
    
    func getCalculation() {
        loading = true
        ApiService.shared.getCalculation(cost: cost, initialFee: Int(initialFee)!, specialConditions: selectedSpecialConditions, term: Int(term)) {
            [weak self] result in
            self?.loading = false
            switch result {
            case .success(let result):
                self?.result = result
            case .failure(let error):
                print("Error \(error)")
            }
        }
    }
}
