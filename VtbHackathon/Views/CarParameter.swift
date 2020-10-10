//
//  CarParameter.swift
//  VtbHackathon
//
//  Created by David Num on 10.10.2020.
//

import SwiftUI

struct CarParameter: View {
    
    var label: String
    var text: String
    
    
    init(label: String, text: String) {
        self.label = label
        self.text = text
    }
        
    var body: some View {
        VStack(alignment: .leading, spacing: nil) {
            Text(label)
                .foregroundColor(Color("Grey50"))
                .font(.system(size: 14.0))
                .padding(.bottom, 1)
            Text(text)
                .foregroundColor(Color("Grey90"))
                .font(.system(size: 14.0))
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(alignment: .topLeading)
    }
}

struct CarParameter_Previews: PreviewProvider {
    static var previews: some View {
        CarParameter(label: "Label", text: "Text")
    }
}
