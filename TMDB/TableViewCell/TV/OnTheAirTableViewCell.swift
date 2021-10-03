//
//  OnTheAirTableViewCell.swift
//  TMDB
//
//  Created by 이상봉 on 2021/10/03.
//

import UIKit
import Kingfisher
import MSPeekCollectionViewDelegateImplementation

class OnTheAirTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    let behavior = MSCollectionViewPeekingBehavior()
    
    var onTheAirTV: [TV] = []
    
    func getTVData(with tvs: [TV]) {
        self.onTheAirTV = tvs
        self.collectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        let onTheAirNib = UINib(nibName: "OnTheAirCollectionViewCell", bundle: nil)
        self.collectionView.register(onTheAirNib, forCellWithReuseIdentifier: "onTheAirCollectionViewCell")
        
        behavior.cellSpacing = 8
        behavior.cellPeekWidth = 50
        behavior.numberOfItemsToShow = 1
        collectionView.configureForPeekingBehavior(behavior: behavior)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension OnTheAirTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onTheAirTV.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onTheAirCollectionViewCell", for: indexPath) as? OnTheAirCollectionViewCell {
            
            
            cell.imageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(onTheAirTV[indexPath.row].backdrop ?? "")"))
            cell.nameLabel.text = onTheAirTV[indexPath.row].name
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
}
