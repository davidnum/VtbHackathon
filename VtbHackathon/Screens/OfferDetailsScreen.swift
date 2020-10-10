//
//  OfferDetailsScreen.swift
//  VtbHackathon
//
//  Created by David Num on 10.10.2020.
//

import SwiftUI

struct OfferDetailsScreen: View {
    
    @State var creditTerm: Double = 1
    @State var initialFee: String = ""
    
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
            
            VStack(spacing: 0) {
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
                    CustomSlider(value: $creditTerm, bounds: 1...5, step: 1)
                        .padding(.bottom, 60)
                }
                
                FloatingTextField(label: "Первоначальный взнос", value: $initialFee, text: "Это 20% от суммы")
                    .keyboardType(.numberPad)
                
                HStack {
                    CreditSummaryItem(label: "Ставка по кредиту", text: "2%")
                        
                    CreditSummaryItem(label: "Сумма кредита", text: "1 356 000 ₽")
                }
                .padding(.top, 24)
                
                CreditSummaryItem(label: "Ежемесячный платеж", text: "57 755 ₽")
                    .padding(.top, 24)
                
                PrimaryButton(text: "Оформить заявку", action: {})
                    .padding(.top, 24)
                
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
