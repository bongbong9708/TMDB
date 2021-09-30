//
//  PosterTableViewCell.swift
//  TMDB
//
//  Created by 이상봉 on 2021/09/30.
//

import UIKit
import Kingfisher
import MSPeekCollectionViewDelegateImplementation

class PosterTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let behavior = MSCollectionViewPeekingBehavior()
    
    var popularMovie: [Movie] = []
    
    func getData(with movies: [Movie]) {
        self.popularMovie = movies
        self.collectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        let popularNib = UINib(nibName: "PosterCollectionViewCell", bundle: nil)
        self.collectionView.register(popularNib, forCellWithReuseIdentifier: "posterCollectionViewCell")
        
        behavior.cellSpacing = 8
        behavior.cellPeekWidth = 50
        behavior.numberOfItemsToShow = 1
        collectionView.configureForPeekingBehavior(behavior: behavior)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension PosterTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularMovie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "posterCollectionViewCell", for: indexPath) as? PosterCollectionViewCell {
            
            cell.imageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(popularMovie[indexPath.row].poster)"))
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}
