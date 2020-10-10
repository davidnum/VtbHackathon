//
//  OffersScreen.swift
//  VtbHackathon
//
//  Created by David Num on 10.10.2020.
//

import SwiftUI

struct OffersScreen: View {
    
    let data = ["1", "2", "3", "4"]
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        appearance.backgroundColor = .white
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        ScrollView {
            ForEach(Array(data.enumerated()), id: \.offset) { idx, _ in
                Pressable(action: {}) {
                    NavigationLink(destination: OfferDetailsScreen()) {
                        OfferRow()
                    }.buttonStyle(PlainButtonStyle())
                }
                .padding()
                
                if(idx < data.count - 1) {
                    HStack {}
                        .fullSize()
                        .frame(height: 8)
                        .background(Color("ColdGrey5"))
                }
            }
        }
        .navigationBarTitle("15 предложений", displayMode: .inline)
    }
}

struct OffersScreen_Previews: PreviewProvider {
    static var previews: some View {
        OffersScreen()
    }
}


