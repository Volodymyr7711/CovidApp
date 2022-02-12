//
//  DetailViewModel.swift
//  CovidApp
//
//  Created by Oleksandr on 12.02.2022.
//

import Foundation

struct DetailViewModel: Codable {
    
    let recovered: Int
    let todayDeaths: Int?
    let todayRecovered: Int?
    let continent: String
    let country: String
    let cases: Int
    let deaths: Int?
    let countryInfo: CountryInfo
    
    init(covid: Covid){
        self.continent = covid.continent
        self.recovered = covid.recovered
        self.todayDeaths = covid.todayDeaths
        self.todayRecovered = covid.todayRecovered
        self.country = covid.country
        self.cases = covid.cases
        self.deaths = covid.deaths
        self.countryInfo = covid.countryInfo
    }
}

//struct CountryInfoo: Codable {
//    let flag: String
//    init(countryInfo: CountryInfo){
//        self.flag = countryInfo.flag
//    }
//}
