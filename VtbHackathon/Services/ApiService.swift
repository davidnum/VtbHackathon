//
//  ApiService.swift
//  VtbHackathon
//
//  Created by Эмиль Шалаумов on 10.10.2020.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol ApiServiceProtocol {

	func getMarketplaceList(completion: @escaping (Result<[CarBrandDataModel], Error>) -> Void)
}

final class ApiService: ApiServiceProtocol {

	func getMarketplaceList(completion: @escaping (Result<[CarBrandDataModel], Error>) -> Void) {
		let headers: HTTPHeaders = [
			"x-ibm-client-id": "e0a9ee9438e7c78ec75742a2c331422f",
			"Accept": "application/json"
		]
		AF.request("https://gw.hackathon.vtb.ru/vtb/hackathon/marketplace",
				   method: .get,
				   headers: headers)
			.responseDecodable(of: [String: [CarBrandDataModel]].self) { response in
				guard let cars = response.value else { return }
				completion(.success(cars["list"] ?? []))
		}
	}
}
