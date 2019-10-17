//
//  FactsResponseModel.swift
//  AboutPlaces
//
//  Created by sohail ur rahman on 16/10/19.
//  Copyright © 2019 sohail ur rahman. All rights reserved.
//

import Foundation

struct Facts : Codable {
    let title : String?
    let rows : [Rows]?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case rows = "rows"
    }


}

struct Rows : Codable {
    let title : String?
    let description : String?
    let imageHref : String?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case description = "description"
        case imageHref = "imageHref"
    }

}

//let Facts = try? newJSONDecoder().decode(Facts.self, from: jsonData)
