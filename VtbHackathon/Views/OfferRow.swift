//
//  OfferRow.swift
//  VtbHackathon
//
//  Created by David Num on 10.10.2020.
//

import SwiftUI
import URLImage

struct OfferRow: View {
    
    let url = URL(string: "https://img.gazeta.ru/files3/697/8149697/upload-KO_019-pic4_zoom-1500x1500-43064.jpg")!
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil) {
            Text("Kia Optima IV Рестайлинг, 2016, Седан")
                .fontWeight(.regular)
                .font(.system(size: 18.0))
                .foregroundColor(Color("Grey90"))
            
            Text("от 1 235 000 ₽ ")
                .font(.system(size: 22.0))
                .foregroundColor(Color("Grey90"))
                .fontWeight(.bold)
                .padding(.bottom, 10)
            URLImage(url) { proxy in
                proxy.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .fullSize(alignment: .topLeading)
            }
            .fullSize()
            .frame(width: .none, height: 200, alignment: .center)
            .background(Color("Grey30"))
            .cornerRadius(8.0)
        }
        .fullSize(alignment: .topLeading)
    }
}

struct OfferRow_Previews: PreviewProvider {
    static var previews: some View {
        OfferRow().padding()
    }
}
