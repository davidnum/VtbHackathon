//
//  CarModelDataModel.swift
//  VtbHackathon
//
//  Created by Эмиль Шалаумов on 10.10.2020.
//

import Foundation

struct CarModelDataModel: Decodable {
    
    let id: Int

	let specmetallicPay: Int

	let bodies: [BodyDataModel]
    
    let brand: CarBrandDataModel

	let photo: String

	let titleRus: String
    
    let ownTitle: String

	let absentee: Bool

	let pearlPay: Int
    
    let minPrice: Int
    
    let colorsCount: Int
    
}
