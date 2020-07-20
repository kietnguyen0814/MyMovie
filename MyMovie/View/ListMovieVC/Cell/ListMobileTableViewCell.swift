//
//  ListMobileTableViewCell.swift
//  MyMovie
//
//  Created by Kiet Nguyen on 7/18/20.
//  Copyright © 2020 Kiet Nguyen. All rights reserved.
//

import UIKit

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
    
}
