//
//  ContentView.swift
//  VtbHackathon
//
//  Created by Эмиль Шалаумов on 09.10.2020.
//

import SwiftUI

struct ContentView: View {
    
    enum Screen {
        case Favorites, Main, Profile
    }
    
    let bounds = UIScreen.main.bounds
    @State var currentScreen = Screen.Main
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        appearance.backgroundColor = .white
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $currentScreen) {
                // Favorites
                VStack {
                    Text("Favorites")
                }.tag(Screen.Favorites)
                
                // Main
                VStack {
                    Text("Нажмите, чтобы определить машину")
                        .fontWeight(.semibold)
                        .font(.system(size: 22.0))
                        .padding(.horizontal, 80)
                        .padding(.bottom, 48)
                        .multilineTextAlignment(.center)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image("CameraButton")
                    }
                    .animation(.easeInOut(duration: 0.4))
                    .buttonStyle(ScaleButtonStyle())
                }.tag(Screen.Main)
                
                // Profile
                VStack {
                    Text("Profile")
                }
                .tag(Screen.Profile)
            }
            .tabViewStyle(PageTabViewStyle())
            .navigationBarTitle("Хлавная", displayMode: .inline)
        }
    }
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .opacity(configuration.isPressed ? 0.3 : 1)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
