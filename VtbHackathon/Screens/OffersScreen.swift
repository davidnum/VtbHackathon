//
//  OffersScreen.swift
//  VtbHackathon
//
//  Created by Эмиль Шалаумов on 10.10.2020.
//

import SwiftUI

struct OffersScreen: View {

	let viewModel = OffersViewModel()

	init() {
		let appearance = UINavigationBarAppearance()
		appearance.shadowColor = .clear
		appearance.backgroundColor = .white
		UINavigationBar.appearance().standardAppearance = appearance
		UINavigationBar.appearance().scrollEdgeAppearance = appearance
	}

	var body: some View {
		NavigationView {
			List(viewModel.carList) { car in
				OfferRow(brandName: car.brandName ?? "")
					.onAppear {
						UITableView.appearance().separatorStyle = .none
					}
			}
			.navigationBarTitle(Text("15 предложений"), displayMode: .inline)
		}
	}
}

struct OffersScreen_Previews: PreviewProvider {
    static var previews: some View {
        OffersScreen()
    }
}
