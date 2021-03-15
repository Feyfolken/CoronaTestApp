//
//  ContentView.swift
//  CoronaTestApp
//
//  Created by Feyfolken on 19.02.2021.
//

import SwiftUI

struct ContentView: View {
    @AppStorage ("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("AppBackgroundDarkerColor"),
                                                           Color("AppBackgroundLighterColor"),
                                                           Color("AppBackgroundDarkerColor")]),
                               startPoint: .bottomLeading,
                               endPoint: .topTrailing)
                    .edgesIgnoringSafeArea(.bottom)
                
                ScrollView {
                    VStack {
                        Spacer().frame(height: 30)
                        HeaderView()
                        StatsPanelView()
                        Spacer()
                    }
                }
            }
            .navigationBarTitle("Hi, Vadim")
            
            .toolbar {
                Button(action: {
                    isDarkMode.toggle()
                    
                }) {
                    HStack(spacing: 10) {
                        Image("moon")
                        
                    }
                }
            }
            .onAppear {
                UINavigationBarAppearance()
                    .setNabBarColors()
            }
            
        }.preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
