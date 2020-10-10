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
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(data, id: \.self) { _ in
                        ZStack {
                            OfferRow()
                        }
                        .background(Color.white)
                    }
                    .lineSpacing(8.0)
                }
                
            }
            .background(Color("Grey30"))
            .navigationBarTitle("15 предложений", displayMode: .inline)
        }
    }
}

struct OffersScreen_Previews: PreviewProvider {
    static var previews: some View {
        OffersScreen()
    }
}


