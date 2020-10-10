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

	let headers: HTTPHeaders = [
		"x-ibm-client-id": "e0a9ee9438e7c78ec75742a2c331422f",
		"Accept": "application/json"
	]

	func getMarketplaceList(completion: @escaping (Result<[CarBrandDataModel], AFError>) -> Void) {
		AF.request("https://gw.hackathon.vtb.ru/vtb/hackathon/marketplace",
				   method: .get,
				   headers: headers)
			.responseDecodable(of: [String: [CarBrandDataModel]].self) { response in
				guard let cars = response.value else {
					return
				}
				completion(.success(cars["list"] ?? []))
		}
	}

	func recognizeCar(by image: String, completion: @escaping (Result<[String: Double], Error>) -> Void) {
		AF.request("https://gw.hackathon.vtb.ru/vtb/hackathon/car-recogniz",
				   method: .post,
				   headers: headers).responseDecodable(of: [String: [String: Double]].self) { response in
					guard let probabilities = response.value else { return }
					completion(.success(probabilities["probabilities"] ?? [:]))
				}
	}
}
