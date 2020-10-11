//
//  SplashViewModel.swift
//  VtbHackathon
//
//  Created by Эмиль Шалаумов on 10.10.2020.
//

import Foundation

final class SplashViewModel: ObservableObject {
    
    @Published var cars: [CarBrandDataModel] = []
    @Published var settings: CalculatorSettings?
    
    @Published var loading: Bool = false
    
    @Published var error: Bool = false
    
    @Published var navigated: Bool = false
    
    func getInitialData() {
        error = false
        loading = true
        let dispatchGroup = DispatchGroup()
        getCars(dispatchGroup)
        getCalculatorSettings(dispatchGroup)
        
        dispatchGroup.notify(queue: .main)  {
            self.loading = false
            if(!self.error) {
                self.navigated = true
            }
        }
    }
    
    func getCars(_ dispatchGroup: DispatchGroup) {
        dispatchGroup.enter()
        ApiService.shared.getMarketplaceList { [weak self] result in
            switch result {
            case .success(let cars):
                self?.cars = cars
            default:
                self?.error = true
            }
            dispatchGroup.leave()
        }
    }
    
    func getCalculatorSettings(_ dispatchGroup: DispatchGroup) {
        dispatchGroup.enter()
        ApiService.shared.getCalculatorSettings { [weak self] result in
            switch result {
            case .success(let settings):
                self?.settings = settings
            default:
                self?.error = true
            }
            dispatchGroup.leave()
        }
    }
}
