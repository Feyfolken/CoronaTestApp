//
//  FavoritesGrid.swift
//  CoronaTestApp
//
//  Created by Feyfolken on 02.04.2021.
//

import SwiftUI

struct FavoritesGrid: View {
    @Binding var covidStatsData: CovidStatisticData
    
    private let favoriteCountryCodesList = ["RU", "US", "DE", "CN"]
    private let gridRows = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridRows) {
                ForEach(favoriteCountryCodesList, id: \.self) { countryCode in
                    FavoriteGridCell(countryCode: countryCode, countryCovidStats: covidStatsData.countries.first(where: {countryCode == $0.countryCode}) ?? CovidStatisticsService.mockCovidStatsData.countries.first! )
                }
            }
        }.padding()
    }
}

struct FavoriteGridCell: View {
    var countryCode: String
    var countryCovidStats: CountryCovidStatistic
    
    var body: some View {
        NavigationLink(
            destination: CountryDetailsStatsScreen(countryCovidStats: countryCovidStats),
            label: {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color("InfoViewDarkerColor"),
                                                               Color("InfoViewLighterColor")]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                        .frame(width: 160.0, height: 88.0)
                        .cornerRadius(42)
                    
                    Text(countryCode)
                        .foregroundColor( Color("CommonTextColor"))
                        .font(.custom("Kefa", size: 24))
                }
            })
        
    }
}
