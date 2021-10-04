//
//  TVViewController.swift
//  TMDB
//
//  Created by 이상봉 on 2021/09/29.
//

import UIKit

class TVViewController: UIViewController {

    @IBOutlet weak var tvTableView: UITableView!
    
    var popularTV: [TV] = []
    var topRatedTV: [TV] = []
    var onTheAirTV: [TV] = []
    var detailTV: [TVDetail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let popularNib = UINib(nibName: "PopularTableViewCell", bundle: nil)
        tvTableView.register(popularNib, forCellReuseIdentifier: "popularCell")
        
        let onTheAirNib = UINib(nibName: "OnTheAirTableViewCell", bundle: nil)
        tvTableView.register(onTheAirNib, forCellReuseIdentifier: "onTheAirCell")
        
        let topRatedNib = UINib(nibName: "TopRatedTableViewCell", bundle: nil)
        tvTableView.register(topRatedNib, forCellReuseIdentifier: "topRatedCell")
        
        getData()
    }
    
    func getData() {
        TApi.getTV(source: .popular) { populars in
            self.popularTV = populars
            self.tvTableView.reloadData()
        }
        
        TApi.getTV(source: .topRated) { topRateds in
            self.topRatedTV = topRateds
            self.tvTableView.reloadData()
        }
        
        TApi.getTV(source: .onTheAir) { onTheAirs in
            self.onTheAirTV = onTheAirs
            self.tvTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toShowDetail", sender: nil)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is TVDetailViewController {
            let detailVC = segue.destination as! TVDetailViewController
            let tvIndex = tvTableView.indexPathForSelectedRow?.row

            detailVC.tvId = topRatedTV[tvIndex ?? 0].id
        }
    }
    
    
}


extension TVViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return topRatedTV.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let pCell = tvTableView.dequeueReusableCell(withIdentifier: "popularCell", for: indexPath) as! PopularTableViewCell
            
            pCell.cellDelegate = self
            
            pCell.getTVData(with: popularTV)
            
            return pCell
        } else if indexPath.section == 1 {
            let oCell = tvTableView.dequeueReusableCell(withIdentifier: "onTheAirCell", for: indexPath) as! OnTheAirTableViewCell
            
            oCell.getTVData(with: onTheAirTV)
            
            return oCell
        } else {
            let tCell = tvTableView.dequeueReusableCell(withIdentifier: "topRatedCell", for: indexPath) as! TopRatedTableViewCell
            
            tCell.nameLabel.text = topRatedTV[indexPath.row].name
            tCell.languageLabel.text = topRatedTV[indexPath.row].language.uppercased()
            tCell.dateLabel.text = topRatedTV[indexPath.row].date
            tCell.avgLabel.text = String(topRatedTV[indexPath.row].average)
            tCell.imageLabel.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(topRatedTV[indexPath.row].poster)"))
            
            return tCell
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
            return "On the Air"
        }
        return "Top Rated"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
}

extension TVViewController: CollectionViewCellDelegate {
    func collectionView(collectionviewcell: PopularCollectionViewCell?, index: Int, didTappedInTableViewCell: PopularTableViewCell) {
        performSegue(withIdentifier: "toShowDetail", sender: nil)

        print("얼씨구")
    }
    
}
