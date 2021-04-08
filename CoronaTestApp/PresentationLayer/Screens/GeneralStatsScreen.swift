//
//  ContentView.swift
//  CoronaTestApp
//
//  Created by Feyfolken on 19.02.2021.
//

import SwiftUI

struct GeneralStatsScreen: View {
    @AppStorage ("isDarkMode") private var isDarkMode = false
    @State var covidStatsData: CovidStatisticData = CovidStatisticsService.mockCovidStatsData
    
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
                        FavoritesGrid(covidStatsData: $covidStatsData)
                        StatsPanelView(covidStatsData: $covidStatsData)
                        Spacer()
                    }
                }
            }
            .navigationBarTitle("World stats")
            
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
                
                CovidStatisticsService.getTotalCovidStats { (covidStatsData) in
                    self.covidStatsData = covidStatsData
                }
            }
            
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .accentColor(Color("CommonTextColor"))
        .font(.custom("Kefa", size: 28))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GeneralStatsScreen()
        }
    }
}
