//
//  LoanScreen.swift
//  VtbHackathon
//
//  Created by David Num on 11.10.2020.
//

import SwiftUI

struct LoanScreen: View {
    @State var secondName = "Петров"
    @State var firstName = "Василий"
    @State var middleName = "Петрович"
    @State var birthDate = "20.08.1990"
    @State var city = "Москва"
    @State var country = "Россия"
    @State var email = "test@mail.ru"
    @State var phone = "+7 912 345 67 89"
    
    @ObservedObject var viewModel = LoanViewMode()
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(spacing: 16) {
                    FloatingTextField(label: "Фамилия", value: $secondName)
                    FloatingTextField(label: "Имя", value: $firstName)
                    FloatingTextField(label: "Отчество", value: $middleName)
                    FloatingTextField(label: "Дата рождения", value: $birthDate)
                    FloatingTextField(label: "Город", value: $city)
                    FloatingTextField(label: "Страна", value: $country)
                    
                }.padding()
                
                HStack {}
                    .fullSize()
                    .frame(height: 8)
                    .background(Color("ColdGrey5"))
                VStack {
                    FloatingTextField(label: "Телефон", value:  $phone, text: "Отправим вам СМС с решением банка")
                    FloatingTextField(label: "Email", value: $email, text: "Отправим письмо с информацией о заявке")
                    
                    NavigationLink(
                        destination: SuccessLoanScreen(),
                        isActive: $viewModel.navigated) {
                        PrimaryButton(text: "Оформить заявку", action: {
                            viewModel.makeLoan()
                        }).padding(.top, 24)
                    }
                }
                .padding()
            }
        }
        .navigationBarTitle("Оформление заявки", displayMode: .inline)
    }
}

struct LoanScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoanScreen()
    }
}
