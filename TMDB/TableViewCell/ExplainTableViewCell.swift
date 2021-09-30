//
//  ExplainTableViewCell.swift
//  TMDB
//
//  Created by 이상봉 on 2021/09/30.
//

import UIKit

class ExplainTableViewCell: UITableViewCell {

    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var avgLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
