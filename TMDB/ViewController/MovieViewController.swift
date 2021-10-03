//
//  MovieViewController.swift
//  TMDB
//
//  Created by 이상봉 on 2021/09/29.
//

import UIKit
import Kingfisher

class MovieViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    
    var popularMovie: [Movie] = []
    var topRatedMovie: [Movie] = []
    var upcomingMovie: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let posterNib = UINib(nibName: "PosterTableViewCell", bundle: nil)
        movieTableView.register(posterNib, forCellReuseIdentifier: "posterCell")
        
        let backdropNib = UINib(nibName: "BackdropTableViewCell", bundle: nil)
        movieTableView.register(backdropNib, forCellReuseIdentifier: "backdropCell")
        
        let explainNib = UINib(nibName: "ExplainTableViewCell", bundle: nil)
        movieTableView.register(explainNib, forCellReuseIdentifier: "explainCell")
        
        getData()
    }
    
    func getData() {
        MApi.getMovie(source: .popular) { populars in
            self.popularMovie = populars
            self.movieTableView.reloadData()
        }
        
        MApi.getMovie(source: .topRated) { topRateds in
            self.topRatedMovie = topRateds
            self.movieTableView.reloadData()
        }
        
        MApi.getMovie(source: .upcoming) { upcomings in
            self.upcomingMovie = upcomings
            self.movieTableView.reloadData()
        }
    }

}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return topRatedMovie.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let popularCell = movieTableView.dequeueReusableCell(withIdentifier: "posterCell", for: indexPath) as! PosterTableViewCell
            
            popularCell.getMovieData(with: popularMovie)
            
            return popularCell
        } else if indexPath.section == 1 {
            let upcomingCell = movieTableView.dequeueReusableCell(withIdentifier: "backdropCell", for: indexPath) as! BackdropTableViewCell
            
            upcomingCell.getMovieData(with: upcomingMovie)
            
            return upcomingCell
        } else {
            let topRatedCell = movieTableView.dequeueReusableCell(withIdentifier: "explainCell", for: indexPath) as! ExplainTableViewCell
            
            topRatedCell.titleLabel.text = topRatedMovie[indexPath.row].title
            topRatedCell.languageLabel.text = topRatedMovie[indexPath.row].language.uppercased()
            topRatedCell.dateLabel.text = topRatedMovie[indexPath.row].date
            topRatedCell.avgLabel.text = String(topRatedMovie[indexPath.row].average)
            topRatedCell.imageLabel.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(topRatedMovie[indexPath.row].poster)"))
            
            return topRatedCell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 375
        } else {
            return 200
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Popular"
        } else if section == 1 {
            return "Upcoming"
        }
        return "Top Rated"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}
