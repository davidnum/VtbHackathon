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

	func getMarketplaceList(completion: @escaping (Result<[CarBrandDataModel], AFError>) -> Void)
}

final class ApiService: ApiServiceProtocol {

	static var shared = ApiService()

	private init() { }

	func getMarketplaceList(completion: @escaping (Result<[CarBrandDataModel], AFError>) -> Void) {
		let headers: HTTPHeaders = [
			"x-ibm-client-id": "e0a9ee9438e7c78ec75742a2c331422f",
			"Accept": "application/json"
		]
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

	func recognizeCar(by image: String, completion: @escaping (Result<[String: [String: Double]], Error>) -> Void) {
		let headers: HTTPHeaders = [
			"x-ibm-client-id": "e0a9ee9438e7c78ec75742a2c331422f",
			"Accept": "application/json",
			"Content-Type": "application/json"
		]
		AF.request("https://gw.hackathon.vtb.ru/vtb/hackathon/car-recognize",
				   method: .post,
				   parameters: ["content": image],
				   encoding: JSONEncoding.default,
				   headers: headers).responseDecodable(of: [String: [String: Double]].self) { response in
					guard let probabilities = response.value else {
						return
					}
					completion(.success(probabilities["probabilities"]?.sorted(by: response.value > $1.value)))
				}
	}
    
    func getMarketplaceList(completion: @escaping (Result<[CarBrandDataModel], Error>) -> Void)
    func getCalculatorSettings(completion: @escaping (Result<CalculatorSettings, Error>) -> Void)
}

final class ApiService: ApiServiceProtocol {
    
    let headers: HTTPHeaders = [
        "x-ibm-client-id": "e0a9ee9438e7c78ec75742a2c331422f",
        "Accept": "application/json"
    ]
    
    let baseUrl = "https://gw.hackathon.vtb.ru/vtb/hackathon/"
    let defaultCalculator = "Haval"
    let lang = "ru-RU"
    
    func getMarketplaceList(completion: @escaping (Result<[CarBrandDataModel], Error>) -> Void) {
        
        AF.request("\(baseUrl)marketplace",
                   method: .get,
                   headers: headers)
            .responseDecodable(of: [String: [CarBrandDataModel]].self) { response in
                guard let cars = response.value else { return }
                completion(.success(cars["list"] ?? []))
            }
    }
    
    func getCalculatorSettings(completion: @escaping (Result<CalculatorSettings, Error>) -> Void) {
        AF.request("\(baseUrl)settings",
                   method: .get,
                   parameters: [
                    "name": defaultCalculator,
                    "language": lang
                   ],
                   headers: headers)
            .responseDecodable(of: [String: CalculatorSettings].self) { response in
                guard let cars = response.value else { return }
                completion(.success(cars["list"] ?? []))
            }
    }
}
