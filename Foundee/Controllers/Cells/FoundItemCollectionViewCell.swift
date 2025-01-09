//
//  FoundItemCollectionViewCell.swift
//  Foundee
//
//  Created by Nedyalko Draganov on 04/01/2025.
//

import UIKit

class FoundItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var foundItemImageView: UIImageView!
    @IBOutlet weak var foundItemTitleLabel: UILabel!
    @IBOutlet weak var foundItemLocationFoundLabel: UILabel!
    
    static let indentifier: String = "FoundItemCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with image: UIImage, title: String, locationFound: String) {
        foundItemImageView.image = image
        foundItemTitleLabel.text = title
        foundItemLocationFoundLabel.text = locationFound
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "FoundItemCollectionViewCell", bundle: nil)
    }

}
