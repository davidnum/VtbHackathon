//
//  PrimaryButton.swift
//  VtbHackathon
//
//  Created by David Num on 10.10.2020.
//

import SwiftUI

struct PrimaryButton: View {
    
    typealias Action = () -> Void
    
    var text: String
    var action: Action
    
    var body: some View {
        Pressable(action: action) {
            HStack {
                Text(text)
                    .foregroundColor(.white)
                    .font(.system(size: 16))
            }
            .fullSize()
            .padding(.all, 14)
            .background(Color("Blue60"))
            .cornerRadius(8)
        }
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Text", action: {})
    }
}
