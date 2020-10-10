//
//  FloatingTextField..swift
//  VtbHackathon
//
//  Created by David Num on 10.10.2020.
//

import SwiftUI

struct FloatingTextField: View {
    let label: String
    let value: Binding<String>
    var text: String?
    
    var body: some View {
        VStack (spacing: 5) {
            ZStack(alignment: .leading) {
                Text(label)
                    .foregroundColor(Color("ColdGrey40"))
                    .offset(y: value.wrappedValue.isEmpty ? 0 : -30)
                    .scaleEffect(value.wrappedValue.isEmpty ? 1 : 0.8, anchor: .leading)
                TextField("", text: value)
            }
            .padding(.top, 20)
            .animation(.spring(response: 0.2, dampingFraction: 0.5))
            
            HStack {}
                .fullSize()
                .frame(height: 1)
                .background(Color("ColdGrey40"))
            
            if text != nil {
                Text(text!)
                    .fullSize(alignment: .leading)
                    .foregroundColor(Color("ColdGrey40"))
                    .font(.system(size: 14))
                    .padding(.top, 6)
            }
        }
    }
}

struct FloatingTextField_Previews2: View {
    @State var value: String = ""
    var body: some View {
        FloatingTextField(label: "Label", value: $value, text: "Text")
    }
}

struct FloatingTextField_Previews: PreviewProvider {
    static var previews: some View {
        FloatingTextField_Previews2()
    }
}
