//
//  UserCell.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 26/10/21.
//

import UIKit

class UserCell: SZTableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageUser: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    public func setContent(model: UserViewData) {
        self.titleLabel.text = model.name
    }
}
