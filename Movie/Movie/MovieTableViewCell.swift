//
//  MovieTableViewCell.swift
//  Movie
//
//  Created by Kaysar Altynbek on 08.02.2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // Initialization code
    }
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
