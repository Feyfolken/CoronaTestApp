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
                Spacer()
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
    @State var shadowRadius: CGFloat = 3

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 42, style: .continuous)
                .frame(width: 300.0, height: 108.0)
                .foregroundColor(Color("StatsPanelColor"))
                .shadow(color: Color("InfoViewDarkerColor") , radius: shadowRadius)
                .onAppear(perform: {
                    let baseAnimation = Animation.easeOut(duration: 0.7)
                    let repeated = baseAnimation.repeatForever(autoreverses: true)
                    
                    return withAnimation(repeated) {
                        shadowRadius = 10
                    }
                })
            
            Text(Date(), style: .date)
                .font(.custom("Kefa", size: 28))
                .foregroundColor(Color("InfoViewDarkerColor"))
        }
    }
}
