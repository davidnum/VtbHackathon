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

<<<<<<< HEAD
	func recognizeCar(by image: String, completion: @escaping (Result<[String: [String: Double]], Error>) -> Void) {
=======
	func recognizeCar(by image: String, completion: @escaping (Result<[String: Double], Error>) -> Void) {
		let headers: HTTPHeaders = [
			"x-ibm-client-id": "e0a9ee9438e7c78ec75742a2c331422f",
			"Accept": "application/json",
			"Content-Type": "application/json"
		]
>>>>>>> 6870c5c... поправил ошибку
		AF.request("https://gw.hackathon.vtb.ru/vtb/hackathon/car-recognize",
				   method: .post,
				   parameters: ["content": image],
				   encoding: JSONEncoding.default,
				   headers: headers).responseDecodable(of: [String: [String: Double]].self) { response in
					guard let probabilities = response.value else {
                        completion(.failure(response.error!))
						return
					}
<<<<<<< HEAD
					// completion(.success(probabilities["probabilities"]?.sorted(by: response.value > $1.value)))
=======
					completion(.success(probabilities["probabilities"] ?? [:]))
>>>>>>> 6870c5c... поправил ошибку
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
    
    func getCalculation(cost: Int, initialFee: Int, specialConditions: [String], term: Int, completion: @escaping (Result<CalculatorResult, Error>) -> Void) {
        let params: [String: Any] = [
            "clientTypes": [],
            "cost": cost,
            "initialFee": initialFee,
            "kaskoValue": 0,
            "language": lang,
            "residualPayment": cost - initialFee,
            "settingsName": defaultCalculator,
            "specialConditions": specialConditions,
            "term": term
           ]
        
        AF.request("\(baseUrl)calculate",
                   method: .post,
                   parameters: params,
                   encoding: JSONEncoding.default,
                   headers: headers)
            .responseDecodable(of: CalculatorDataModel.self) { response in
                guard let value = response.value else {
                    completion(.failure(response.error!))
                    return
                }
                completion(.success(value.result))
            }
    }
}
