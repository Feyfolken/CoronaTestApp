//
//  CovidStatisticsService.swift
//  CoronaTestApp
//
//  Created by Feyfolken on 06.03.2021.
//

import Foundation

final class CovidStatisticsService {
    
    private static let urlString = "https://api.covid19api.com/summary"
    private static let mockGlobalCovidStats = GlobalCovidStatistic(newConfirmed: 4500,
                                                                   totalConfirmed: 10201020,
                                                                   newDeaths: 1009,
                                                                   totalDeaths: 901020,
                                                                   newRecovered: 6500,
                                                                   totalRecovered: 9019203,
                                                                   date: "")
    private static let mockCountriesCovidStats = CountryCovidStatistic(id: "",
                                                                       country: "",
                                                                       countryCode: "",
                                                                       slug: "",
                                                                       newConfirmed: 5090,
                                                                       totalConfirmed: 100953,
                                                                       newDeaths: 2002,
                                                                       totalDeaths: 40090,
                                                                       newRecovered: 6041,
                                                                       totalRecovered: 60293,
                                                                       date: "")
    
    public static let mockCovidStatsData = CovidStatisticData(id: "",
                                                              message: "",
                                                              global: mockGlobalCovidStats,
                                                              countries: [mockCountriesCovidStats],
                                                              date: "")
    
    public static func getTotalCovidStats(completion: @escaping (CovidStatisticData) -> ()) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            var covidStatsData: CovidStatisticData!
            
            do {
                 covidStatsData = try JSONDecoder().decode(CovidStatisticData.self, from: data!)
                
            } catch {
                covidStatsData = mockCovidStatsData
            }
            
            DispatchQueue.main.async {
                completion(covidStatsData)
            }
            
        }.resume()
    }
}
