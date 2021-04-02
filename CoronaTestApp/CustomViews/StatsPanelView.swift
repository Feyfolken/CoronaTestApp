//
//  StatsPanel.swift
//  CoronaTestApp
//
//  Created by Feyfolken on 20.02.2021.
//

import SwiftUI

struct StatsPanelView: View {
    @Binding var covidStatsData: CovidStatisticData
    @AppStorage ("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 42, style: .continuous)
                .frame(width: 385.0, height: 558.0)
                .foregroundColor(Color("StatsPanelColor"))
                .shadow(color: isDarkMode ? Color("InfoViewDarkerColor") : .gray , radius: 5)
            
            VStack {
                HStack {
                    StatsInfoView(titleText: "New confirmed",
                                  valueText: "\(covidStatsData.global.newConfirmed )")
                    
                    Spacer().frame(width: 20)
                    
                    StatsInfoView(titleText: "Total confirmed",
                                  valueText: "\(covidStatsData.global.totalConfirmed )")
                }
                
                Spacer().frame(height: 20)
                
                HStack {
                    StatsInfoView(titleText: "New deaths",
                                  valueText: "\(covidStatsData.global.newDeaths )")
                    
                    Spacer().frame(width: 20)
                    
                    StatsInfoView(titleText: "Total deaths",
                                  valueText: "\(covidStatsData.global.totalDeaths )")
                }
                
                Spacer().frame(height: 20)
                
                HStack {
                    StatsInfoView(titleText: "New recovered",
                                  valueText: "\(covidStatsData.global.newRecovered )")
                    
                    Spacer().frame(width: 20)
                    
                    StatsInfoView(titleText: "Total recovered",
                                  valueText: "\(covidStatsData.global.totalRecovered )")
                }
            }
        }
    }
}
