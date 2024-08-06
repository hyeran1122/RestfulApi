//
//  MyTableViewCell.swift
//  MovieApiPrectice
//
//  Created by 김혜란 on 8/6/24.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
