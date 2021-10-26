//
//  CommentCell.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 27/10/21.
//

import UIKit

class CommentCell: SZTableViewCell {

    @IBOutlet var containerView: UIView!
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.containerView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setContent(model: CommentModel) {
        self.userLabel.text = model.name
        self.descriptionLabel.text = model.body
    }
}
