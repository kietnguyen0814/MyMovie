//
//  MovieTBVCViewModel.swift
//  MyMovie
//
//  Created by Kiet Nguyen on 7/19/20.
//  Copyright © 2020 Kiet Nguyen. All rights reserved.
//

import Foundation

protocol MovieTBVCViewModel {
    var articleVM: MovieModel { get }
    var ratingVM: String { get }
    var titleVM: String { get }
    var overviewVM: String { get }
    var releseDateVM: String { get }
    var smallpreviewVM: String { get }
    var posterviewVM: String { get }
}


extension MovieModel: MovieTBVCViewModel {
    
    var titleVM: String {
        return title ?? ""
    }
    
    var ratingVM: String {
        return "\(voteAverage ?? 0.0)" + " ★"
    }
    var overviewVM: String {
        return overview ?? ""
    }
    
    var releseDateVM: String {
        return "Release date: " + "\(releaseDate ?? "")"
    }
    
    var smallpreviewVM: String {
        return backdropPath ?? ""
    }
    
    var posterviewVM: String {
        return posterPath ?? ""
    }
    
    var articleVM: MovieModel {
        return self
    }
    
}
