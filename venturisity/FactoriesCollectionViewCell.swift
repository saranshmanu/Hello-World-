//
//  FactoriesCollectionViewCell.swift
//  venturisity
//
//  Created by Saransh Mittal on 02/10/18.
//  Copyright © 2018 Saransh Mittal. All rights reserved.
//

import UIKit

class FactoriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var factoryImageView: UIImageView!
    @IBOutlet weak var factoryNameLabel: UILabel!
    @IBOutlet weak var factoryAddressLabel: UILabel!
    @IBOutlet weak var whiteBackgroundView: UIView!
    @IBOutlet weak var viewButton: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        whiteBackgroundView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        whiteBackgroundView.layer.shadowOpacity = 0.2
        whiteBackgroundView.layer.shadowOffset = CGSize(width: 0.5, height: 0.4)
        whiteBackgroundView.layer.shadowRadius = 5
        viewButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        viewButton.layer.shadowOpacity = 0.4
        viewButton.layer.shadowOffset = CGSize(width: 0.5, height: 0.4)
        viewButton.layer.shadowRadius = 5
    }
}
