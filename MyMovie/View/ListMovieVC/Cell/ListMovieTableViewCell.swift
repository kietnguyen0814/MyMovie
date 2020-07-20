//
//  ListMovieTableViewCell.swift
//  MyMovie
//
//  Created by Kiet Nguyen on 7/18/20.
//  Copyright © 2020 Kiet Nguyen. All rights reserved.
//

import UIKit
import Kingfisher

class ListMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var imvPoster: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var viewModel: MovieTBVCViewModel? {
        didSet {
            bindViewModel()
        }
    }
    
    private func bindViewModel() {
        if let vm = viewModel {
//            https://image.tmdb.org/t/p/w500/kjMbDciooTbJPofVXgAoFjfX8Of.jpg
            lblTitle.text = vm.titleVM
            lblReleaseDate.text = vm.releseDateVM
            lblRating.text = vm.ratingVM            
            let url = URL(string: Constants.IMG_DOMAIN + "/t/p/w500" + vm.posterviewVM)
            imvPoster.kf.setImage(with: url)
            self.layoutIfNeeded()
        }
    }
    
}
