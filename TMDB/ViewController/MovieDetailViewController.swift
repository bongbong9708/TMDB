//
//  MovieDetailViewController.swift
//  TMDB
//
//  Created by 이상봉 on 2021/10/06.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var voteAvgLabel: UILabel!
    @IBOutlet weak var homepageLabel: UILabel!
    
    var movieDetail: MovieDetail?
    
    var movieId: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(movieId)
        
        getMovieDetailData(movieId: movieId)
        
    }
    
    func getMovieDetailData(movieId: Int) {
        MApi.getDetailMovie(movieId: movieId) { [self] result in
            self.movieDetail = result
            
            self.titleLabel.text = movieDetail?.title
            self.imageLabel.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(movieDetail?.backdrop ?? "")"))
            self.releaseDateLabel.text = "Release date : \(movieDetail?.date ?? "")"
            self.statusLabel.text = movieDetail?.status
            self.runtimeLabel.text = "Runtime : \(movieDetail?.runtime ?? 0) min"
            self.overviewLabel.text = movieDetail?.overview
            self.voteAvgLabel.text = "Vote Average : \(movieDetail?.voteAvg ?? 0.0)"
            self.homepageLabel.text = "Homepage : \(movieDetail?.homepage ?? "")"
        }
        
    }
   
}
