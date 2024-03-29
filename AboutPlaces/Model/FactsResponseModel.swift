//
//  FactsResponseModel.swift
//  AboutPlaces
//
//  Created by sohail ur rahman on 16/10/19.
//  Copyright © 2019 sohail ur rahman. All rights reserved.
//

import Foundation

// Codable class
struct Facts : Codable {
    let title : String?
    let rows : [Rows]?
}

struct Rows : Codable {
    let title : String?
    let description : String?
    let imageHref : String?
}

