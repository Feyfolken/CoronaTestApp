//
//  CovidStatisticsService.swift
//  CoronaTestApp
//
//  Created by Feyfolken on 06.03.2021.
//

import Foundation

final class CovidStatisticsService {
    
    private static let urlString = "https://api.covid19api.com/summary"
    
    public static func getTotalCovidStats(completion: @escaping (CovidStatisticData) -> ()) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            var covidStatsData: CovidStatisticData!
            
            do {
                 covidStatsData = try JSONDecoder().decode(CovidStatisticData.self, from: data!)
                
            } catch {
                let mockGlobalCovidStats = GlobalCovidStatistic(newConfirmed: 4500,
                                                                totalConfirmed: 10201020,
                                                                newDeaths: 1009,
                                                                totalDeaths: 901020,
                                                                newRecovered: 6500,
                                                                totalRecovered: 9019203,
                                                                date: "")
                let mockCountriesCovidStats = CountryCovidStatistic(id: "",
                                                                    country: "",
                                                                    countryCode: "",
                                                                    slug: "",
                                                                    newConfirmed: 0,
                                                                    totalConfirmed: 0,
                                                                    newDeaths: 0,
                                                                    totalDeaths: 0,
                                                                    newRecovered: 0,
                                                                    totalRecovered: 0,
                                                                    date: "")
                covidStatsData = CovidStatisticData(id: "",
                                                    message: "",
                                                    global: mockGlobalCovidStats,
                                                    countries: [mockCountriesCovidStats],
                                                    date: "")
            }
            
            DispatchQueue.main.async {
                completion(covidStatsData)
            }
            
        }.resume()
    }
}
