//
//  Pressable.swift
//  VtbHackathon
//
//  Created by David Num on 10.10.2020.
//

import SwiftUI

struct Pressable<Content: View>: View {
    
    @State private var pressed = false
    
    typealias Action = () -> Void
    
    var action: Action
    var content: Content
    
    init(action: @escaping Action, @ViewBuilder content: () -> Content) {
        self.action = action
        self.content = content()
    }
    
    var body: some View {
        Button(action: self.action) {
            self.content
        }
        .scaleEffect(self.pressed ? 0.98 : 1)
        .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { pressing in
            withAnimation(.easeInOut(duration: 0.2)) {
                self.pressed = pressing
            }
        }, perform: { })
        .buttonStyle(PressableStyle())
    }
}


struct PressableStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct Pressable_Previews: PreviewProvider {
    static var previews: some View {
        Pressable(action: {}) {}
    }
}
