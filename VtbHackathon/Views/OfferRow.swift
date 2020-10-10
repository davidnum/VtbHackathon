//
//  OfferRow.swift
//  VtbHackathon
//
//  Created by David Num on 10.10.2020.
//

import SwiftUI
import URLImage

struct OfferRow: View {
    
    
    
    var model: CarModelDataModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil) {
            Text("Kia Optima IV Рестайлинг, 2016, Седан")
                .fontWeight(.regular)
                .font(.system(size: 18.0))
                .foregroundColor(Color("Grey90"))
            
            Text("от \(model.minPrice) ₽")
                .font(.system(size: 22.0))
                .foregroundColor(Color("Grey90"))
                .fontWeight(.bold)
                .padding(.bottom, 10)
            URLImage(URL(string: model.photo)!) { proxy in
                proxy.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .fullSize(alignment: .topLeading)
            }
            .fullSize()
            .frame(width: .none, height: 200, alignment: .center)
            .cornerRadius(8.0)
        }
        .fullSize(alignment: .topLeading)
    }
}

