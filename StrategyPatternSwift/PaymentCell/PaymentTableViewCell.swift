//
//  PaymentTableViewCell.swift
//  StrategyPatternSwift
//
//  Created by Jonathan Ngabo on 2021-02-17.
//

import UIKit

class PaymentTableViewCell: UITableViewCell {
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    static let identifier : String = "PaymentTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.titleLabel.text = ""
        self.statusImage.image = UIImage.init(systemName: "bookmark.circle")
    }

    
    var paymentMethod : PaymentMethod?{
        didSet{
            if let item = self.paymentMethod{
                self.titleLabel.text = item.name
                self.statusImage.image = item.isSelected ? UIImage.init(systemName: "bookmark.circle.fill") : UIImage.init(systemName: "bookmark.circle")
            }
        }
    }
 
    
}
