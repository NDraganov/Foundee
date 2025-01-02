//
//  LostItemTableViewCell.swift
//  Foundee
//
//  Created by Nedyalko Draganov on 24/12/2024.
//

import UIKit

class LostItemTableViewCell: UITableViewCell {
    
    static let identifier = "LostItemTableViewCell"

    static func nib() -> UINib {
      return UINib(nibName: "LostItemTableViewCell", bundle: nil)
    }

    public func configure(with title: String, itemNote: String, itemName: String, itemImage: UIImage) {
        lostItemLabel.text = title  // The name of the item
        lostItemNoteLabel.text = itemNote  // Item description
        lostItemNameLabel.text = itemName  // The name of the owner of the lost item
        lostItemImageView.image = itemImage // The item image
    }
    
    @IBOutlet var lostItemLabel: UILabel!
    @IBOutlet var lostItemNoteLabel: UILabel!
    @IBOutlet var lostItemNameLabel: UILabel!
    @IBOutlet var lostItemImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
