//
//  PopularTableViewCell.swift
//  TMDB
//
//  Created by 이상봉 on 2021/10/03.
//

import UIKit
import Kingfisher
import MSPeekCollectionViewDelegateImplementation

protocol CollectionViewCellDelegate: AnyObject {
    func collectionView(collectionviewcell: PopularCollectionViewCell?, index: Int, didTappedInTableViewCell: PopularTableViewCell)
}

class PopularTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let behavior = MSCollectionViewPeekingBehavior()
    
    var popularTV: [TV] = []
    
    weak var cellDelegate: CollectionViewCellDelegate?
    
    func getTVData(with tvs: [TV]) {
        self.popularTV = tvs
        self.collectionView.reloadData()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        let popularNib = UINib(nibName: "PopularCollectionViewCell", bundle: nil)
        self.collectionView.register(popularNib, forCellWithReuseIdentifier: "popularCollectionViewCell")
        
        behavior.cellSpacing = 8
        behavior.cellPeekWidth = 50
        behavior.numberOfItemsToShow = 1
        collectionView.configureForPeekingBehavior(behavior: behavior)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension PopularTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularTV.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCollectionViewCell", for: indexPath) as? PopularCollectionViewCell {
            
            cell.imageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(popularTV[indexPath.row].poster)"))
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? PopularCollectionViewCell
        self.cellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)
    }
    
    
    
}
