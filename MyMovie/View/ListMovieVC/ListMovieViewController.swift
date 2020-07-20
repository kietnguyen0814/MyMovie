//
//  ListMovieViewController.swift
//  MyMovie
//
//  Created by Kiet Nguyen on 7/18/20.
//  Copyright © 2020 Kiet Nguyen. All rights reserved.
//

import UIKit

class ListMovieViewController: UIViewController {
    @IBOutlet weak var myTableView: UITableView!
    var viewModel: MovieViewModel!
    
    fileprivate func setupView() {
        viewModel = MovieViewModel(delegate: self)
        viewModel.getMovies()
        let nib = UINib(nibName: "ListMovieTableViewCell", bundle: nil)
        myTableView.register(nib, forCellReuseIdentifier: "ListMovieTableViewCell")
//        myTableView.isHidden = true
        self.navigationItem.title = "Hot Movie"
//        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
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
    
}

extension UITableView {
    func indicatorView() -> UIActivityIndicatorView {
        var activityIndicatorView = UIActivityIndicatorView()
        if self.tableFooterView == nil {
            let indicatorFrame = CGRect(x: 0, y: 0, width: self.bounds.width, height: 40)
            activityIndicatorView = UIActivityIndicatorView(frame: indicatorFrame)
            activityIndicatorView.isHidden = false
            activityIndicatorView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin]
            activityIndicatorView.isHidden = true
            self.tableFooterView = activityIndicatorView
            return activityIndicatorView
        } else {
            return activityIndicatorView
        }
    }
    
    func addLoading(_ indexPath:IndexPath, completion: @escaping (() -> Void)) {
        if let lastVisibleIndexPath = self.indexPathsForVisibleRows?.last {
            indicatorView().startAnimating()
            if indexPath == lastVisibleIndexPath && indexPath.row == self.numberOfRows(inSection: 0) - 1 {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { 
                    completion()
                }
            }
        }
        self.tableFooterView?.isHidden = false
    }
    
    func stopLoading(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [unowned self] in
            self.indicatorView().stopAnimating()
            self.tableFooterView?.isHidden = true
        }
    }
}

extension ListMovieViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.currentCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListMovieTableViewCell", for: indexPath) as! ListMovieTableViewCell
        cell.viewModel = viewModel.movie(at: indexPath.row)
        cell.layoutIfNeeded()
        return cell
    }
}

extension ListMovieViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let controller = MovieDetailViewController()
        controller.viewModel = viewModel.movie(at: indexPath.row)
//        controller.hidesBottomBarWhenPushed = true
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.addLoading(indexPath) { [unowned self] in
            self.viewModel.getMovies()
        }
    }
}

extension ListMovieViewController: IMovieViewModelDelegate {
    func getMovieCompleted(withResultCount count: Int) {
        myTableView.stopLoading()
        myTableView.reloadData()
    }
    
    func getMovieFailed(withError error: Any) {
        myTableView.stopLoading()
        print(error)
        self.showCustomAlertWith(title: "Oh no!", message: "Something went wrong\n Please try again later") {
        }
    }
}

extension ListMovieViewController: DisplayCustomAlert {
    func showCustomAlertWith(title: String, message: String, completion: @escaping (() -> Void)) {
        guard presentedViewController == nil else {
            return
        }
        let alertVC = CustomAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.setDefaultButtonBgColor(color: Constants.RED_COLOR)
        alertVC.setDefaultButtonHightlightBgColor(color: Constants.HIGH_LIGHT_RED_COLOR)
        let okAction = CustomAlertAction(titleDefault: "OK") { _ in
            completion()
        }
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
    }
}
