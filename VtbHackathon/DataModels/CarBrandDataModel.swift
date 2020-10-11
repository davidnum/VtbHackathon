//
//  CarBrandDataModel.swift
//  VtbHackathon
//
//  Created by Эмиль Шалаумов on 10.10.2020.
//

import Foundation

struct CarBrandDataModel: Decodable {

	let titleRus: String

	let country: CountryDataModel

	let isOutbound: Bool

	let logo: String

	let absentee: Bool

	let models: [CarModelDataModel]?
    
    let currentModelsTotal: Int
}
