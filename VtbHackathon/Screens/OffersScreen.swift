//
//  OffersScreen.swift
//  VtbHackathon
//
//  Created by David Num on 10.10.2020.
//

import SwiftUI

struct OffersScreen: View {
    
    @EnvironmentObject var splashViewModel: SplashViewModel
    
    var brand: CarBrandDataModel
    
    init(brand: CarBrandDataModel) {
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        appearance.backgroundColor = .white
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        self.brand = brand
    }
    
    var body: some View {
        ScrollView {
            ForEach(Array(brand.models!.enumerated()), id: \.offset) { idx, model in
                Pressable(action: {}) {
                    NavigationLink(destination: OfferDetailsScreen(model: model, settings: splashViewModel.settings!)) {
                        OfferRow(model: model)
                    }.buttonStyle(PlainButtonStyle())
                }
                .padding()
                
                if(idx < brand.models!.count - 1) {
                    HStack {}
                        .fullSize()
                        .frame(height: 8)
                        .background(Color("ColdGrey5"))
                }
            }
        }
        .navigationBarTitle("\(brand.currentModelsTotal ?? 4) предложения", displayMode: .inline)
    }
}


