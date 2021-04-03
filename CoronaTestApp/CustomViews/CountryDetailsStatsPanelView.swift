//
//  CountryDetailsStatsPanelView.swift
//  CoronaTestApp
//
//  Created by Feyfolken on 03.04.2021.
//

import SwiftUI

struct CountryDetailsStatsPanelView: View {
    @Binding var countryCovidStats: CountryCovidStatistic
    @State private var shadowRadius: CGFloat = 3
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 42, style: .continuous)
                .frame(width: 370.0, height: 558.0)
                .foregroundColor(Color("StatsPanelColor"))
                .shadow(color: Color("InfoViewDarkerColor") , radius: shadowRadius)
                .onAppear(perform: {
                    let baseAnimation = Animation.easeOut(duration: 0.7)
                    let repeated = baseAnimation.repeatForever(autoreverses: true)
                    
                    return withAnimation(repeated) {
                        shadowRadius = 10
                    }
                })
            
            VStack {
                Text("NEW")
                    .font(.custom("Kefa", size: 28))
                    .foregroundColor(Color("InfoViewDarkerColor"))
                
                
                
                HStack {
                    StatsInfoView(titleText: "Confirmed",
                                  valueText: "\(countryCovidStats.newConfirmed)",
                                  frameSize: CGSize(width: 110, height: 140),
                                  titleTextFrameSize: CGSize(width: 70, height: 20),
                                  valueTextFrameSize: CGSize(width: 70, height: 60),
                                  fontSize: 20)
                    
                    StatsInfoView(titleText: "Deaths",
                                  valueText: "\(countryCovidStats.newDeaths)",
                                  frameSize: CGSize(width: 120, height: 140),
                                  titleTextFrameSize: CGSize(width: 70, height: 20),
                                  valueTextFrameSize: CGSize(width: 70, height: 60),
                                  fontSize: 20)
                    
                    StatsInfoView(titleText: "Recovered",
                                  valueText: "\(countryCovidStats.newRecovered)",
                                  frameSize: CGSize(width: 110, height: 140),
                                  titleTextFrameSize: CGSize(width: 70, height: 20),
                                  valueTextFrameSize: CGSize(width: 70, height: 60),
                                  fontSize: 20)
                }
                
                Spacer().frame(height: 50)
                
                Text("TOTAL")
                    .font(.custom("Kefa", size: 28))
                    .foregroundColor(Color("InfoViewDarkerColor"))
                
                HStack {
                    StatsInfoView(titleText: "Confirmed",
                                  valueText: "\(countryCovidStats.totalConfirmed)",
                                  frameSize: CGSize(width: 110, height: 140),
                                  titleTextFrameSize: CGSize(width: 70, height: 20),
                                  valueTextFrameSize: CGSize(width: 70, height: 60),
                                  fontSize: 20)
                    
                    StatsInfoView(titleText: "Deaths",
                                  valueText: "\(countryCovidStats.totalDeaths)",
                                  frameSize: CGSize(width: 120, height: 140),
                                  titleTextFrameSize: CGSize(width: 70, height: 20),
                                  valueTextFrameSize: CGSize(width: 70, height: 60),
                                  fontSize: 20)
                    
                    StatsInfoView(titleText: "Recovered",
                                  valueText: "\(countryCovidStats.totalRecovered)",
                                  frameSize: CGSize(width: 110, height: 140),
                                  titleTextFrameSize: CGSize(width: 70, height: 20),
                                  valueTextFrameSize: CGSize(width: 70, height: 60),
                                  fontSize: 20)
                }
            }.padding()
        }
    }
}
