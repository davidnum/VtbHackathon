//
//  OfferDetailsScreen.swift
//  VtbHackathon
//
//  Created by David Num on 10.10.2020.
//

import SwiftUI

struct OfferDetailsScreen: View {
    
    @State var creditTerm: Double = 1
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: nil) {
                OfferRow()
                    .padding(.bottom)
                HStack {
                    CarParameter(label: "Год выпуска", text: "2016")
                        .fullSize(alignment: .leading)
                    CarParameter(label: "Тип кузова", text: "Седан")
                        .fullSize(alignment: .leading)
                }
                .padding(.bottom)
                HStack {
                    CarParameter(label: "Количество цветов", text: "4")
                        .fullSize(alignment: .leading)
                }
                .padding(.bottom)
                
                Pressable(action: {}) {
                    HStack {
                        Image("Star")
                            .padding(.horizontal, 6)
                        Text("Добавить в избранное")
                    }
                    .fullSize()
                    .padding(.all, 14)
                    .background(Color("ColdGrey5"))
                    .cornerRadius(8.0)
                }
            }
            .padding()
            HStack {}
                .fullSize()
                .frame(height: 8)
                .background(Color("ColdGrey5"))
            
            VStack() {
                Text("Рассчитайте кредит на это авто")
                    .foregroundColor(Color("Grey90"))
                    .fontWeight(.semibold)
                    .font(.system(size: 18.0))
                    .padding(.bottom)
                    .fullSize(alignment: .leading)
                VStack {
                    Text("Срок кредита (от 1 года до 5)")
                        .foregroundColor(Color("Grey50"))
                        .font(.system(size: 14.0))
                        .padding(.bottom, 1)
                        .fullSize(alignment: .leading)
                    Text(String(format: "%g", creditTerm))
                        .foregroundColor(Color("Grey90"))
                        .font(.system(size: 16.0))
                        .fullSize(alignment: .leading)
                    ZStack(alignment: .leading) {
                        Slider(value: $creditTerm, in: 1...5, step: 1)
                        Circle()
                            .fill(Color("Blue60"))
                            .frame(width: 10, height: 10)
                            .cornerRadius(5)
                            .offset(x: (CGFloat(creditTerm) - 1) * 100, y: 0)
                    }
                    
                       
                }
            }
            .padding()
        }
        .navigationBarTitle("Kia Optima", displayMode: .inline)
    }
}

struct OfferDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        OfferDetailsScreen()
    }
}
