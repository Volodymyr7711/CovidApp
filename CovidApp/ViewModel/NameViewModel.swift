//
//  NameViewModel.swift
//  CovidApp
//
//  Created by Oleksandr on 17.02.2022.
//

import Foundation

class NameViewModel{
    let id: String?
    let name: String?
    
    init(name: Name){
        self.id = name.id
        self.name = name.name
    }
}
