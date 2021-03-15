//
//  CovidStatisticData.swift
//  CoronaTestApp
//
//  Created by Feyfolken on 06.03.2021.
//

import Foundation

struct CovidStatisticData: Decodable {
    var id: String
    var message: String
    var global: GlobalCovidStatistic
    var countries: [CountryCovidStatistic]
    var date: String
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case message = "Message"
        case global = "Global"
        case countries = "Countries"
        case date = "Date"
    }
}
