//
//  OfferRow.swift
//  VtbHackathon
//
//  Created by Эмиль Шалаумов on 10.10.2020.
//

import SwiftUI

struct OfferRow: View {

	let brandName: String

    var body: some View {
		VStack(alignment: .leading) {
			Text("\(brandName) Optima, 2016, Седан")
				.font(.system(size: CGFloat(20)))
				.fontWeight(.regular)
			Text("от 1 235 000 ₽")
				.font(.system(size: CGFloat(22)))
				.fontWeight(.semibold)
			Image("CarTest")
				.resizable()
				.scaledToFit()
				//.padding(.trailing, 16)

		}
    }
}

struct OfferRow_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			OfferRow(brandName: "Kia").previewLayout(.fixed(width: 300, height: 500))
			OfferRow(brandName: "Hyundai").previewLayout(.fixed(width: 300, height: 70))
		}
    }
}
