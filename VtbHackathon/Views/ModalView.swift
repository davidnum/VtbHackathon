//
//  ModalView.swift
//  VtbHackathon
//
//  Created by Эмиль Шалаумов on 11.10.2020.
//

import UIKit

struct ModalView: View {
	@Environment(\.presentationMode) var presentation
	let message: String

	var body: some View {
		VStack {
			Text(message)
			Button("Dismiss") {
				self.presentation.value.dismiss()
			}
		}
	}
}
