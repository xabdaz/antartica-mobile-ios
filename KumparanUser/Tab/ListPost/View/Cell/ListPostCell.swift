//
//  ListPostCell.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 24/10/21.
//

import UIKit

class ListPostCell: SZTableViewCell {
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setContent(model: ListPostViewData) {
        self.titleLabel.text = model.title
        self.descriptionLabel.text = model.description
    }
    
}
