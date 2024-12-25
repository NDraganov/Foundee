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

    public func configure(with title: String, imageName: String) {
      lostItemLabel.text = title
      lostItemImageView.image = UIImage(systemName: imageName)
    }

    @IBOutlet var lostItemImageView: UIImageView!
    @IBOutlet var lostItemLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
