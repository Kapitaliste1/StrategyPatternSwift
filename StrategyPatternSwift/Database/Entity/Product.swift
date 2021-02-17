//
//  Product.swift
//  StrategyPatternSwift
//
//  Created by Jonathan Ngabo on 2021-02-17.
//

import Foundation

public class Product : NSObject{
    var id: String?
    var price: Double = 0.0
    var name: String = ""
    var isSelected: Bool = false
    
    convenience init(name : String, price : Double) {
        self.init()
        self.name = name
        self.price = price
        self.id = UUID().uuidString
    }
    
    
}
