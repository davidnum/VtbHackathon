//
//  CustomCheckbox.swift
//  VtbHackathon
//
//  Created by David Num on 11.10.2020.
//

import SwiftUI

struct CustomCheckbox: View {
    
    typealias Action = () -> Void
    
    var action: Action
    var checked: Bool
    var label: String
    
    var body: some View {
        Pressable(action: action) {
            HStack {
                ZStack {
                    Image("CheckboxInactive")
                        .scaleEffect(checked ? 0 : 1)
                        .animation(.spring(response: 0.2, dampingFraction: 0.5))
                        Image("CheckboxActive")
                            .scaleEffect(checked ? 1 : 0)
                            .animation(.spring(response: 0.2, dampingFraction: 0.5))
                }
                Text(label)
                    .font(.system(size: 14))
                    .foregroundColor(Color("Grey90"))
                    .fixedSize(horizontal: false, vertical: true)
            }
        }.fullSize(alignment: .leading)
    }
}


//struct CustomCheckbox_Previews2: View {
//
//    @State var checked = false
//
//    var body: some View {
//        CustomCheckbox(checked: $checked, label: "Checkbox")
//    }
//}
//
//struct CustomCheckbox_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomCheckbox_Previews2()
//    }
//}
