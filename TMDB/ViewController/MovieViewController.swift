//
//  MovieViewController.swift
//  TMDB
//
//  Created by 이상봉 on 2021/09/29.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    
    var popularMovie: [Movie] = []
    var topRatedMovie: [Movie] = []
    var upcomingMovie: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let posterNib = UINib(nibName: "PosterTableViewCell", bundle: nil)
        movieTableView.register(posterNib, forCellReuseIdentifier: "posterCell")
        
        
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
        
//        MApi.getMovie(source: .upcoming) { upcomings in
//            self.upcomingMovie = upcomings
//            self.movieTableView.reloadData()
//        }
    }

}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let pCell = movieTableView.dequeueReusableCell(withIdentifier: "posterCell", for: indexPath) as! PosterTableViewCell
            
            pCell.getData(with: popularMovie)
            
            return pCell
        } else if indexPath.section == 1 {
            let pCell = movieTableView.dequeueReusableCell(withIdentifier: "posterCell", for: indexPath) as! PosterTableViewCell
            
            pCell.getData(with: popularMovie)
            
            return pCell
        }
        let pCell = movieTableView.dequeueReusableCell(withIdentifier: "posterCell", for: indexPath) as! PosterTableViewCell
        
        pCell.getData(with: popularMovie)
        
        return pCell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 375
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Popualr"
        } else if section == 1{
            return "Upcoming"
        }
        return "Top Rated"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
}
