//
//  TVDetailViewController.swift
//  TMDB
//
//  Created by 이상봉 on 2021/10/04.
//

import UIKit
import Kingfisher

class TVDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var voteAvgLabel: UILabel!
    @IBOutlet weak var homepageLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var tvDetail: TVDetail?
    
    var tvId: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(tvId)
        
        getTVDetailData(tvId: tvId)
    }
    
    func getTVDetailData(tvId: Int) {
        TApi.getDetailTV(tvId: tvId) { [self] result in
            self.tvDetail = result
            
            self.nameLabel.text = tvDetail?.name
            self.imageLabel.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(tvDetail?.backdrop ?? "")"))
            self.dateLabel.text = "First air date : \(tvDetail?.firstDate ?? "")"
            self.overviewLabel.text = tvDetail?.overview
            self.voteAvgLabel.text = "Vote Average : \(tvDetail?.voteAvg ?? 0.0)"
            self.homepageLabel.text = "Homepage : \(tvDetail?.homepage ?? "")"
            self.statusLabel.text = tvDetail?.status
            
        }
    }

}
