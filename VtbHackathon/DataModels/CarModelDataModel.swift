//
//  CarModelDataModel.swift
//  VtbHackathon
//
//  Created by Эмиль Шалаумов on 10.10.2020.
//

import Foundation

struct CarModelDataModel: Decodable {

	let specmetallicPay: Int

	let bodies: [BodyDataModel]

	let photo: String

	let titleRus: String

	let absentee: Bool

	let pearlPay: Int
}
