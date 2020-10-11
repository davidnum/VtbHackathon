//
//  UIImage+Extension.swift
//  VtbHackathon
//
//  Created by Эмиль Шалаумов on 10.10.2020.
//

import UIKit

extension UIImage {

	func toBase64() -> String? {
		guard let imageData = self.jpegData(compressionQuality: 0.001) else { return nil }//.pngData() else { return nil }
		return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
	}

	func toString() -> String? {
		let data: Data? = self.jpegData(compressionQuality: 0.4)
			return data?.base64EncodedString(options: .endLineWithLineFeed)
		}
}
