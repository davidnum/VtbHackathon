//
//  ContentView.swift
//  VtbHackathon
//
//  Created by Эмиль Шалаумов on 09.10.2020.
//

import SwiftUI

struct MainScreen: View {
    
    enum Screen: Int {
        case Favorites, Main, Profile
    }
    
    let titles = [
        Screen.Favorites: "Избранное",
        Screen.Main: "Главная",
        Screen.Profile: "Профиль",
    ]
    let bounds = UIScreen.main.bounds
    
    @State var currentScreen = Screen.Main
    
    var body: some View {
        //NavigationView {
            TabView(selection: $currentScreen.animation()) {
                // Favorites
                VStack {
                    Text("Избранное")
                }
                .tag(Screen.Favorites)
                
                // Main
                
                VStack {
                    Text("Нажмите, чтобы\nопределить машину")
                        .fontWeight(.semibold)
                        .font(.system(size: 22.0))
                        .padding(.horizontal, 30)
                        .padding(.bottom, 48)
                        .multilineTextAlignment(.center)
                    
                    Pressable(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        NavigationLink(destination: OffersScreen()) {
                            Image("CameraButton")
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .tag(Screen.Main)
                
                
                // Profile
                VStack {
                    Text("Профиль")
                }
                .tag(Screen.Profile)
            }
            .padding(.bottom, 80)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            .navigationBarTitle(titles[currentScreen] ?? "", displayMode: .inline)
            .overlay(TabViewDots(count: 3, currentIndex: currentScreen.rawValue), alignment: .top)
        //}
    }
}


struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainScreen()
        }
    }
}
