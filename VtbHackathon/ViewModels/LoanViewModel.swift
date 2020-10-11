//
//  LoanViewModel.swift
//  VtbHackathon
//
//  Created by David Num on 11.10.2020.
//

import Foundation

class LoanViewMode: ObservableObject {
    @Published var navigated = false
    @Published var loading: Bool = false
    
    
    func makeLoan() {
        loading = true
        ApiService.shared.makeLoan() {
            [weak self] result in
            self?.loading = false
            switch result {
            case .success( _):
                self?.navigated = true
            case .failure(let error):
                print("Error \(error)")
            }
        }
    }
}
