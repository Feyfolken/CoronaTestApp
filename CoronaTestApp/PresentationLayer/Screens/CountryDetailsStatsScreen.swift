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
                Spacer().frame(height: 50)
                CurrentDateView()
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

struct CurrentDateView: View {
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("InfoViewDarkerColor"),
                                                        Color("InfoViewLighterColor")]),
                            startPoint: .leading,
                            endPoint: .trailing)
                 .frame(width: 300, height: 108)
                 .cornerRadius(42)
            
            Text(Date(), style: .date)
                .font(.custom("Kefa", size: 28))
                .foregroundColor(Color("CommonTextColor"))
        }
    }
}
