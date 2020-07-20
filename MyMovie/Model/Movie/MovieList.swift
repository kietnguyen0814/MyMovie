//
//  MovieList.swift
//  MyMovie
//
//  Created by Kiet Nguyen on 7/19/20.
//  Copyright © 2020 Kiet Nguyen. All rights reserved.
//

import Foundation

struct MovieList : Codable {
    
    let dates : MovieDate?
    let page : Int?
    let results : [MovieModel]?
    let totalPages : Int?
    let totalResults : Int?
    
    
    enum CodingKeys: String, CodingKey {
        case dates
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dates = try MovieDate(from: decoder)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        results = try values.decodeIfPresent([MovieModel].self, forKey: .results)
        totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
        totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
    }
}

