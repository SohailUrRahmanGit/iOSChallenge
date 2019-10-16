//
//  FactsResponseModel.swift
//  AboutPlaces
//
//  Created by sohail ur rahman on 16/10/19.
//  Copyright © 2019 sohail ur rahman. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct Facts: Codable {
    let title: String
    let rows: [Row]
}

struct Row: Codable {
    let title, rowDescription: String?
    let imageHref: String?

    enum CodingKeys: String, CodingKey {
        case title
        case rowDescription = "description"
        case imageHref
    }
}


//let Facts = try? newJSONDecoder().decode(Welcome.self, from: jsonData)
