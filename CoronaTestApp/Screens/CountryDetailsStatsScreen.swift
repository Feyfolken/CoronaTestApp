//
//  CountryDetailsStatsScreen.swift
//  CoronaTestApp
//
//  Created by Feyfolken on 02.04.2021.
//

import SwiftUI

struct CountryDetailsStatsScreen: View {
    @AppStorage ("isDarkMode") private var isDarkMode = false
    
    @State var countryCovidStats: CountryCovidStatistic
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("AppBackgroundDarkerColor"),
                                                       Color("AppBackgroundLighterColor"),
                                                       Color("AppBackgroundDarkerColor")]),
                           startPoint: .bottomLeading,
                           endPoint: .topTrailing)
                .edgesIgnoringSafeArea(.bottom)
            
            ScrollView {
                CountryDetailsStatsPanelView(countryCovidStats: $countryCovidStats)
            }
        }.navigationTitle("\(countryCovidStats.country)")
    }
}

struct CountryDetailsStatsScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CountryDetailsStatsScreen(countryCovidStats: CovidStatisticsService.mockCovidStatsData.countries.first!)
        }
    }
}
