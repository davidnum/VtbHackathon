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
}

final class ApiService: ApiServiceProtocol {

	let headers: HTTPHeaders = [
        "x-ibm-client-id": "e0a9ee9438e7c78ec75742a2c331422f",
		"Accept": "application/json",
		"Content-Type": "application/json"
    ]
    
    let baseUrl = "https://gw.hackathon.vtb.ru/vtb/hackathon/"
    let defaultCalculator = "Haval"
    let lang = "ru-RU"

	static var shared = ApiService()

	private init() { }

	func getMarketplaceList(completion: @escaping (Result<[CarBrandDataModel], AFError>) -> Void) {
		AF.request("\(baseUrl)marketplace",
				   method: .get,
				   headers: headers)
			.responseDecodable(of: [String: [CarBrandDataModel]].self) { response in
				guard let cars = response.value else {
                    completion(.failure(response.error!))
					return
				}
				completion(.success(cars["list"] ?? []))
		}
	}

	func recognizeCar(by image: String, completion: @escaping (Result<[String: [String: Double]], Error>) -> Void) {
		AF.request("https://gw.hackathon.vtb.ru/vtb/hackathon/car-recognize",
				   method: .post,
				   parameters: ["content": image],
				   encoding: JSONEncoding.default,
				   headers: headers).responseDecodable(of: [String: [String: Double]].self) { response in
					guard let probabilities = response.value else {
                        completion(.failure(response.error!))
						return
					}
					// completion(.success(probabilities["probabilities"]?.sorted(by: response.value > $1.value)))
				}
	}

	func getCalculatorSettings(completion: @escaping (Result<CalculatorSettings, AFError>) -> Void) {
        AF.request("\(baseUrl)settings?name=\(defaultCalculator)&language=\(lang)",
                   method: .get,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .responseDecodable(of: CalculatorSettings.self) { response in
                guard let settings = response.value else {
                    completion(.failure(response.error!))
                    return
                }
                completion(.success(settings))
            }
    }
}
