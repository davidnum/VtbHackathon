//
//  CreditSummaryItem.swift
//  VtbHackathon
//
//  Created by David Num on 10.10.2020.
//

import SwiftUI

struct CreditSummaryItem: View {
    let label: String
    var text: String
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .foregroundColor(Color("Grey90"))
                .font(.system(size: 14.0))
            Text(text)
                .foregroundColor(Color("Grey90"))
                .font(.system(size: 22.0))
                .bold()
        }.fullSize(alignment: .leading)
    }
}

struct CreditSummaryItem_Previews: PreviewProvider {
    static var previews: some View {
        CreditSummaryItem(label: "Label", text: "Text")
    }
}
