//
//  SplashScreen.swift
//  VtbHackathon
//
//  Created by Эмиль Шалаумов on 10.10.2020.
//

import SwiftUI

struct SplashScreen: View {

	@EnvironmentObject var viewModel: SplashViewModel

	@State private var shouldAnimate = false

	init() {
		let appearance = UINavigationBarAppearance()
		appearance.shadowColor = .clear
		appearance.backgroundColor = .white
		UINavigationBar.appearance().standardAppearance = appearance
		UINavigationBar.appearance().scrollEdgeAppearance = appearance
	}

	var body: some View {
			VStack {
				ActivityIndicator().padding(160)
			}
            .fullScreenCover(isPresented: $viewModel.navigated) {
				MainScreen(brand: viewModel.cars[0])
            }
			.onAppear {
				viewModel.getInitialData()
			}
			.background(Color("Blue60"))
	}
}

struct ActivityIndicator: View {

	let style = StrokeStyle(lineWidth: 10, lineCap: .round)

	@State var animate = false

	let color = Color.white

	let color2 = Color.white//.opacity(0.5)

	var body: some View {
		ZStack {
			Circle()
				.trim(from: 0, to: 0.7)
				.stroke(AngularGradient(gradient: .init(colors: [color, color2]), center: .center), style: style)
				.rotationEffect(Angle(degrees: animate ? 360 : 0))
				.animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
		}.onAppear() {
			self.animate.toggle()
		}
	}
}
