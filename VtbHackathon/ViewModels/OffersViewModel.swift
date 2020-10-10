//
//  OffersViewModel.swift
//  VtbHackathon
//
//  Created by Эмиль Шалаумов on 10.10.2020.
//

import Foundation

final class OffersViewModel {

	struct Car: Identifiable {
		var id = UUID()

		var brandName: String?
	}

	var carList: [Car] {
		return [Car(brandName: "Kia"), Car(brandName: ""), Car(brandName: "Hyundai"), Car(brandName: ""), Car(brandName: "Lada")]
	}
}
