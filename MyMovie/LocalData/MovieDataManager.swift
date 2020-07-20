//
//  MovieDataManager.swift
//  MyMovie
//
//  Created by Kiet Nguyen on 7/20/20.
//  Copyright © 2020 Kiet Nguyen. All rights reserved.
//

import Foundation
import MagicalRecord

protocol IMovieDataManager {
    func saveMovieFrom(movieList: [MovieModel], completion: @escaping () -> Void)
}

final class MovieDataManager: IMovieDataManager {
    func saveMovieFrom(movieList: [MovieModel], completion: @escaping () -> Void) {
        if (movieList.count == 0) {
            completion()
        } else {
            var multipleDict : [[AnyHashable : Any]] = []
            for movie in movieList {
                let dict: [String : Any] = [
                    "adult": movie.adult ?? false,
                    "backdropPath": movie.backdropPath ?? "",
                    "genreIds": movie.genreIds ?? "",
                    "movieID": movie.movieID ?? 0,
                    "originalLanguage": movie.originalLanguage ?? "",
                    "originalTitle": movie.originalTitle ?? "",
                    "overview": movie.overview ?? "",
                    "popularity": movie.popularity ?? 0,
                    "posterPath": movie.posterPath ?? "",
                    "releaseDate": movie.releaseDate ?? "",
                    "title": movie.title ?? "",
                    "video": movie.video ?? false,
                    "voteAverage": movie.voteAverage ?? 0,
                    "voteCount": movie.voteCount ?? 0,
                ]
                multipleDict.append(dict)
            }
            
            MagicalRecord.save({ (localContext) in
                Movie.mr_import(from: multipleDict, in: localContext)
                //            Movie.mr_import(from: movieList, in: localContext)
            }) { (isSuccess, error) in
                print("Successfully saved")
                completion()
            }
        }
    }
}
