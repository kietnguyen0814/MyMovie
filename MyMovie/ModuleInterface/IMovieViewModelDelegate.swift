//
//  IMovieViewModelDelegate.swift
//  MyMovie
//
//  Created by Kiet Nguyen on 7/19/20.
//  Copyright © 2020 Kiet Nguyen. All rights reserved.
//

import Foundation
protocol IMovieViewModelDelegate: class {
    func getMovieCompleted(withResultCount count:Int)
    func getMovieFailed(withError error: Any)
}
