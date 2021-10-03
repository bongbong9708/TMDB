//
//  BackdropTableViewCell.swift
//  TMDB
//
//  Created by 이상봉 on 2021/09/30.
//

import UIKit
import Kingfisher
import MSPeekCollectionViewDelegateImplementation

class BackdropTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let behavior = MSCollectionViewPeekingBehavior()
    
    var upcomingMovie: [Movie] = []
    
    func getMovieData(with movies: [Movie]) {
        self.upcomingMovie = movies
        self.collectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        let upcomingNib = UINib(nibName: "BackDropCollectionViewCell", bundle: nil)
        self.collectionView.register(upcomingNib, forCellWithReuseIdentifier: "backdropCollectionViewCell")
        
        behavior.cellSpacing = 8
        behavior.cellPeekWidth = 50
        behavior.numberOfItemsToShow = 1
        collectionView.configureForPeekingBehavior(behavior: behavior)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension BackdropTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return upcomingMovie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "backdropCollectionViewCell", for: indexPath) as? BackDropCollectionViewCell {
            
            cell.imageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(upcomingMovie[indexPath.row].backdrop)"))
            cell.titleLabel.text = upcomingMovie[indexPath.row].title
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
}
