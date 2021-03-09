//
//  Covid.swift
//  CovidApp
//
//  Created by Volodymyr Mendyk on 04.03.2021.
//

import Foundation


struct Covid: Codable {
    var country: String
    var cases: Int
    var deaths: Int?
    var todayDeaths: Int?
    var recovered: Int?
    var continent: String
    var todayRecovered: Int?
    var countryInfo: CountryInfo
}

struct CountryInfo: Codable {
    var flag: String
}
