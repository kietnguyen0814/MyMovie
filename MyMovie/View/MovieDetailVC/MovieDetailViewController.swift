//
//  MovieDetailViewController.swift
//  MyMovie
//
//  Created by Kiet Nguyen on 7/18/20.
//  Copyright © 2020 Kiet Nguyen. All rights reserved.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var imvBackdrop: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblRate: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var lblVoteCount: UILabel!
    @IBOutlet weak var lblPopularity: UILabel!
    
    var viewModel: MovieDetailViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Movie Detail"
        bindViewModel()
        // Do any additional setup after loading the view.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func bindViewModel() {
        if let vm = viewModel {
            let url = URL(string: vm.backdropPathDetailVM)
            imvBackdrop.kf.setImage(with: url)
            lblTitle.text = vm.titleDetailVM
            lblReleaseDate.text = vm.releaseDateDetailVM
            lblRate.text = vm.ratingDetailVM
            lblOverview.text = vm.overviewDetailVM
            lblVoteCount.text = vm.voteCountDetailVM
            lblPopularity.text = vm.popularityDetailVM
        }
    }
}
