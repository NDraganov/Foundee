//
//  LostItemTableViewCell.swift
//  Foundee
//
//  Created by Nedyalko Draganov on 24/12/2024.
//

import UIKit

class LostItemTableViewCell: UITableViewCell {
    
    @IBOutlet var lostItemLabel: UILabel!
    @IBOutlet var lostItemNoteLabel: UILabel!
    @IBOutlet var lostItemNameLabel: UILabel!
    @IBOutlet var lostItemImageView: UIImageView!
    
    static let identifier = "LostItemTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func configure(with title: String, itemNote: String, itemName: String, itemImage: UIImage) {
        lostItemLabel.text = title  // The name of the item
        lostItemNoteLabel.text = itemNote  // Item description
        lostItemNameLabel.text = itemName  // The name of the owner of the lost item
        lostItemImageView.image = itemImage // The item image
    }
    
    static func nib() -> UINib {
      return UINib(nibName: "LostItemTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
