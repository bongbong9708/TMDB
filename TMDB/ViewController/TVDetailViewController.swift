//
//  TVDetailViewController.swift
//  TMDB
//
//  Created by 이상봉 on 2021/10/04.
//

import UIKit
import Kingfisher

class TVDetailViewController: UIViewController {

    @IBOutlet weak var imageLabel: UIImageView!
    
    var tvDetail: TVDetail?
    
    var tvId: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(tvId)
        
        getDetailData(tvId: tvId)
    }
    
    func getDetailData(tvId: Int) {
        TApi.getDetailTV(tvId: tvId) { [self] result in
            self.tvDetail = result
            
            self.imageLabel.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(tvDetail?.backdrop ?? "")"))
        }
    }

}
