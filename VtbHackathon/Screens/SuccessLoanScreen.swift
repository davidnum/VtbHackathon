//
//  SuccessLoanScreen.swift
//  VtbHackathon
//
//  Created by David Num on 11.10.2020.
//

import SwiftUI

struct SuccessLoanScreen: View {
    var body: some View {
        VStack {
            VStack {
                Image("Check")
                    .padding(.bottom, 16)
                Text("Заявка на автокредит\nотправлена")
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 22))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 16)
                
                Text("СМС с решением банка отправим\nвам в течение трех дней")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.center)
            }.fullSize()
            
            Pressable(action: {}) {
                HStack {
                    Text("Хорошо")
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                }
                .fullSize(alignment: .bottom)
                .frame(height: 20)
                .padding(.all, 14)
                .background(Color("Blue60"))
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.white, lineWidth: 2))
            }
                
        }
        .fullSize(alignment: .center)
        .padding()
        .background(Color("Blue60"))
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct SuccessLoanScreen_Previews: PreviewProvider {
    static var previews: some View {
        SuccessLoanScreen()
    }
}
