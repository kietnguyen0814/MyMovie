//
//  File.swift
//  MyMovie
//
//  Created by Kiet Nguyen on 7/18/20.
//  Copyright © 2020 Kiet Nguyen. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    static let SERVER_DOMAIN = "https://api.themoviedb.org"
    static let IMG_DOMAIN = "https://image.tmdb.org"
    static let API_KEY = "8e3967947a95555f9c430e68d070a0e7"
    static let API_GET_NOW_PLAYING = "3/movie/now_playing"
    static let GREEN_COLOR = UIColor.init(red: 41.0/255.0, green: 198.0/255.0, blue: 77.0/255.0, alpha: 1)
    static let HIGH_LIGHT_GREEN_COLOR = UIColor.init(red: 41.0/255.0, green: 198.0/255.0, blue: 77.0/255.0, alpha: 0.7)
    
    static let RED_COLOR = UIColor.init(red: 248.0/255.0, green: 49.0/255.0, blue: 73.0/255.0, alpha: 1)
    static let HIGH_LIGHT_RED_COLOR = UIColor.init(red: 248.0/255.0, green: 49.0/255.0, blue: 73.0/255.0, alpha: 0.7)
}
