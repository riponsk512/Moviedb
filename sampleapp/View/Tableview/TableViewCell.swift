//
//  TableViewCell.swift
//  sampleapp
//
//  Created by Ripon sk on 30/07/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var img: LazyImageLoaderView!
    @IBOutlet weak var tiitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
