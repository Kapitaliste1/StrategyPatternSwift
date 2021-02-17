//
//  ProductTableViewCell.swift
//  StrategyPatternSwift
//
//  Created by Jonathan Ngabo on 2021-02-17.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    
    static let identifier : String = "ProductTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.titleLabel.text = ""
        self.statusImage.image = UIImage.init(systemName: "bookmark.circle")
    }

    
    var product : Product?{
        didSet{
            if let item = self.product{
                self.titleLabel.text = item.name
                self.statusImage.image = item.isSelected ? UIImage.init(systemName: "bookmark.circle.fill") : UIImage.init(systemName: "bookmark.circle")
            }
        }
    }
}
