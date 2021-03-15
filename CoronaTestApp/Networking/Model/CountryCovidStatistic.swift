//
//  CountryCovidStatistic.swift
//  CoronaTestApp
//
//  Created by Feyfolken on 06.03.2021.
//

import Foundation

struct CountryCovidStatistic: Decodable {
    var id: String
    var country: String
    var countryCode: String
    var slug: String
    var newConfirmed: Int
    var totalConfirmed: Int
    var newDeaths: Int
    var totalDeaths: Int
    var newRecovered: Int
    var totalRecovered: Int
    var date: String
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case country = "Country"
        case countryCode = "CountryCode"
        case slug = "Slug"
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
        case date = "Date"
    }
}
