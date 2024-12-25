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

    public func configure(with title: String, itemNote: String, itemName: String) {
        lostItemLabel.text = title  // The name of the item
        lostItemNoteLabel.text = itemNote  // Item description
        lostItemNameLabel.text = itemName  // The name of the founder
    }

    
    @IBOutlet var lostItemLabel: UILabel!
    @IBOutlet var lostItemNoteLabel: UILabel!
    @IBOutlet var lostItemNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
