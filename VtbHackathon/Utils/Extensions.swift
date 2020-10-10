//
//  Extensions.swift
//  VtbHackathon
//
//  Created by David Num on 10.10.2020.
//

import SwiftUI

extension View {
    func fullSize(alignment: Alignment = .center) -> some View {
        self.frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: alignment
        )
    }
    
}
