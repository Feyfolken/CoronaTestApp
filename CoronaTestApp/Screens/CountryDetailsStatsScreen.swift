//
//  CountryDetailsStatsScreen.swift
//  CoronaTestApp
//
//  Created by Feyfolken on 02.04.2021.
//

import SwiftUI

struct CountryDetailsStatsScreen: View {
    @AppStorage ("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("AppBackgroundDarkerColor"),
                                                       Color("AppBackgroundLighterColor"),
                                                       Color("AppBackgroundDarkerColor")]),
                           startPoint: .bottomLeading,
                           endPoint: .topTrailing)
                .edgesIgnoringSafeArea(.bottom)
            
            ScrollView {
                ZStack {
                    RoundedRectangle(cornerRadius: 42, style: .continuous)
                        .frame(width: 385.0, height: 558.0)
                        .foregroundColor(Color("StatsPanelColor"))
                        .shadow(color: isDarkMode ? Color("InfoViewDarkerColor") : .gray , radius: 5)
                    
                    VStack {
                        Text("NEW")
                        
                    }
                }
            }
        }
    }
}

struct CountryDetailsStatsScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CountryDetailsStatsScreen()
        }
    }
}
