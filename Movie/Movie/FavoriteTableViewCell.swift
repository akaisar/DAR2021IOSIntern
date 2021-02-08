//
//  FavoriteTableViewCell.swift
//  Movie
//
//  Created by Kaysar Altynbek on 08.02.2021.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var titleLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
