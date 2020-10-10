//
//  BodyDataModel.swift
//  VtbHackathon
//
//  Created by Эмиль Шалаумов on 10.10.2020.
//

import Foundation

struct BodyDataModel: Decodable {

	let alias: String

	let doors: Int

	let photo: String

	let title: String

	let type: String

	let typeTitle: String
}
