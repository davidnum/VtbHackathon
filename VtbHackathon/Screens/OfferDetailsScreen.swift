//
//  OfferDetailsScreen.swift
//  VtbHackathon
//
//  Created by David Num on 10.10.2020.
//

import SwiftUI

struct OfferDetailsScreen: View {
    
    @ObservedObject var viewModel = CalculatorViewModel()
    @State var pressed = false
    
    var model: CarModelDataModel
    
    init(model: CarModelDataModel, settings: CalculatorSettings) {
        self.model = model
        viewModel.cost = model.minPrice
        viewModel.initialFee = String(settings.initialFee)
        viewModel.specialConditions = settings.specialConditions
        viewModel.selectedSpecialConditions = settings.specialConditions
            .filter { $0.isChecked }
            .map { $0.id }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: nil) {
                OfferRow(model: model)
                    .padding(.bottom)
                
                CarParameter(label: "Типы кузова", text: model.bodies
                                .map { $0.title }
                                .joined(separator: ", "))
                    .fullSize(alignment: .leading)
                    .padding(.bottom)
                
                CarParameter(label: "Год выпуска", text: "2016")
                    .fullSize(alignment: .leading)
                    .padding(.bottom)
                
                CarParameter(label: "Количество цветов", text: "\(model.colorsCount)")
                    .fullSize(alignment: .leading)
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
                    ForEach(viewModel.specialConditions, id: \.id) { cond in
                        CustomCheckbox(action: {
                            withAnimation {
                                viewModel.checkCondition(cond)
                            }
                        }, checked: viewModel.isConditionSelected(cond: cond), label: cond.name)
                    }
                }.padding(.bottom, 16)
                
                VStack {
                    Text("Срок кредита (от 1 года до 7)")
                        .foregroundColor(Color("Grey50"))
                        .font(.system(size: 14.0))
                        .padding(.bottom, 1)
                        .fullSize(alignment: .leading)
                    Text(String(format: "%g", viewModel.term))
                        .foregroundColor(Color("Grey90"))
                        .font(.system(size: 16.0))
                        .fullSize(alignment: .leading)
                    CustomSlider(value: $viewModel.term, bounds: 1...7, step: 1)
                        .padding(.bottom, 60)
                }
                
                FloatingTextField(label: "Первоначальный взнос", value: $viewModel.initialFee, text: "Это \(Int(Double(viewModel.initialFee)! / Double(viewModel.cost) * 100.0)) % от суммы")
                    .keyboardType(.numberPad)
                
                HStack {
                    CreditSummaryItem(label: "Ставка по кредиту", text: String(viewModel.result?.contractRate ?? 0) )
                    CreditSummaryItem(label: "Сумма кредита", text: "\(viewModel.result?.loanAmount.formattedWithSeparator ?? "0") ₽")
                }
                .padding(.top, 24)
                
                CreditSummaryItem(label: "Ежемесячный платеж", text: "\(viewModel.result?.payment.formattedWithSeparator ?? "0") ₽")
                    .padding(.top, 24)
                NavigationLink(
                    destination: LoanScreen(),
                    isActive: $pressed) {
                    PrimaryButton(text: "Оформить заявку", action: {
                        pressed = true
                    })
                        .padding(.top, 24)
                }
              
                    
               
                
            }
            .padding()
        }
        .onAppear(perform: {
            viewModel.getCalculation()
        })
        .onChange(of: viewModel.term, perform: { value in
            viewModel.getCalculation()
        })
        .onChange(of: viewModel.initialFee, perform: { value in
            viewModel.getCalculation()
        })
        .navigationBarTitle("\(model.brand.titleRus) \(model.titleRus)", displayMode: .inline)
        
    }
}
