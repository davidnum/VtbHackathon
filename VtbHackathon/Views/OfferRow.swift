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
        Button(action: {}) {
            VStack(alignment: .leading, spacing: nil) {
                Text("Kia Optima, 2016")
                    .fontWeight(.semibold)
                    .font(.system(size: 18.0))
                    .foregroundColor(Color("Grey90"))
                
                Text("750 000 – 1 950 000 ₽")
                    .font(.system(size: 14.0))
                    .foregroundColor(Color("ColdGrey50"))
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
        .buttonStyle(OfferPressableStyle())
    }
}


struct OfferPressableStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            .animation(.easeInOut(duration: 0.3))
    }
    
    
}

struct OfferRow_Previews: PreviewProvider {
    static var previews: some View {
        OfferRow().padding()
    }
}
