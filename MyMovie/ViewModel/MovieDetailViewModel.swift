//
//  MovieDetailViewModel.swift
//  MyMovie
//
//  Created by Kiet Nguyen on 7/19/20.
//  Copyright © 2020 Kiet Nguyen. All rights reserved.
//

import Foundation
protocol MovieDetailViewModel {
    
    var articleDetailVM: MovieModel { get }
    
    var ratingDetailVM: String { get }
    
    var titleDetailVM: String { get }
    
    var overviewDetailVM: String { get }
    
    var releaseDateDetailVM: String { get }
    
    var backdropPathDetailVM: String { get }
    
    var popularityDetailVM: String { get }
    
    var voteCountDetailVM: String { get }
}

extension MovieModel: MovieDetailViewModel {
    var popularityDetailVM: String {
        return "\(popularity ?? 0)"
    }
    
    var voteCountDetailVM: String {
        return "\(voteCount ?? 0)"
    }
    
    var titleDetailVM: String {
        return title ?? ""
    }
    
    var ratingDetailVM: String {
        return "★ " + "\(voteAverage ?? 0.0)"
    }
    
    var overviewDetailVM: String {
        return overview ?? ""
    }
    
    var releaseDateDetailVM: String {
        return releaseDate ?? ""
    }
    
    var backdropPathDetailVM: String {        
        return Constants.IMG_DOMAIN + "/t/p/w500" + (backdropPath ?? "")
    }
    
    var articleDetailVM: MovieModel {
        return self
    }
    
}
