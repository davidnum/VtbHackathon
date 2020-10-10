//
//  SplashViewModel.swift
//  VtbHackathon
//
//  Created by Эмиль Шалаумов on 10.10.2020.
//

import Foundation

final class SplashViewModel: ObservableObject {

	@Published var cars: [CarBrandDataModel] = []

	@Published var loading: Bool = false

	@Published var error: Bool = false

	@Published var navigated: Bool = false

	let apiService: ApiServiceProtocol

	init(apiService: ApiServiceProtocol) {
		self.apiService = apiService
	}

	func getCars() {
		error = false
		loading = true
		apiService.getMarketplaceList { [weak self] result in
			self?.loading = false
			switch result {
			case .success(let cars):
				self?.navigated = true
				self?.cars = cars
			default:
				self?.error = true
			}
		}
	}
}
