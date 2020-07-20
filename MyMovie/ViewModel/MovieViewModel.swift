//
//  MovieViewModel.swift
//  MyMovie
//
//  Created by Kiet Nguyen on 7/19/20.
//  Copyright © 2020 Kiet Nguyen. All rights reserved.
//

import Foundation
import Alamofire

final class MovieViewModel {
    private weak var delegate: IMovieViewModelDelegate?
    
    private var movies: [MovieModel] = []
    private var currentPage = 1
    private var total = 0
    private var isFetchInProgress = false
    
    var restAPI : IWebservice!
    
    init(restAPI: IWebservice = Webservice(), delegate:IMovieViewModelDelegate) {
        self.restAPI = restAPI
        self.delegate = delegate
    }
    
    var totalCount: Int {
        return total
    }
    
    var currentCount: Int {
        return movies.count
    }
    
    func movie(at index: Int) -> MovieModel {
        return movies[index]
    }
    
    func getMovies() {
        guard !isFetchInProgress else {
            return
        }
        
        isFetchInProgress = true
        let url = Constants.SERVER_DOMAIN + "/" + Constants.API_GET_NOW_PLAYING
        //        let url = URL(string: Constants.SERVER_DOMAIN + Constants.API_GET_NOW_PLAYING)!
        let parameter: Parameters = ["api_key":Constants.API_KEY,
                                     "page":currentPage]
//        print(url)
//        print(parameter)
        restAPI.getMethod(MovieList.self, parameters: parameter, Url: url) { result in
            switch result {
            // 3
            case .failure(let error):
                DispatchQueue.main.async { [unowned self] in
                    self.isFetchInProgress = false                
                    self.delegate?.getMovieFailed(withError: error)
                }
            // 4
            case .success(let response):
                self.currentPage += 1
                self.isFetchInProgress = false
                if let response = response as? MovieList {
                    self.total = response.totalResults ?? 0
                    if let results =  response.results {
                        self.movies.append(contentsOf: results)
                    }
                    if response.page ?? 0 > 1 {
                        if let results =  response.results {
                            let movieManager : IMovieDataManager = MovieDataManager()
                            movieManager.saveMovieFrom(movieList: results) {                                
                                DispatchQueue.main.async { [unowned self] in
                                    self.delegate?.getMovieCompleted(withResultCount: results.count)
                                }
                            }
                        }
                    } else {
                        let movieManager : IMovieDataManager = MovieDataManager()
                        movieManager.saveMovieFrom(movieList: response.results ?? []) {
                            DispatchQueue.main.async { [unowned self] in
                                self.delegate?.getMovieCompleted(withResultCount: (response.results?.count ?? 0))
                            }
                        }
                    }
                }
                
            }
        }
    }
}
