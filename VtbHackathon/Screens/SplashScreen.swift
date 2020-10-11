//
//  SplashScreen.swift
//  VtbHackathon
//
//  Created by Эмиль Шалаумов on 10.10.2020.
//

import SwiftUI

struct SplashScreen: View {

	@EnvironmentObject var viewModel: SplashViewModel

	init() {
		let appearance = UINavigationBarAppearance()
		appearance.shadowColor = .clear
		appearance.backgroundColor = .white
		UINavigationBar.appearance().standardAppearance = appearance
		UINavigationBar.appearance().scrollEdgeAppearance = appearance
	}

	var body: some View {
		NavigationView {
			VStack {
                if(viewModel.error) {
                    Text("Произошла ошибка")
                }
                if viewModel.loading {
                    ProgressView()
                }
            }.fullScreenCover(isPresented: $viewModel.navigated) {
                MainScreen(brand: viewModel.cars[0])
            }
			.onAppear {
				viewModel.getInitialData()
			}
		}
	}
}
