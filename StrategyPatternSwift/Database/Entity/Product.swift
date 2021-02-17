//
//  Product.swift
//  StrategyPatternSwift
//
//  Created by Jonathan Ngabo on 2021-02-17.
//

import Foundation

public class Product : NSObject{
    private var id: String?
    private var price: Double = 0.0
    private var name: String = ""
    private var isSelected: Bool = false
    
    convenience init(name : String, price : Double) {
        self.init()
        self.name = name
        self.price = price
        self.id = UUID().uuidString
    }
    
    func getDummyArray() -> [Product] {
        var toReturn : [Product] = [Product]()
        
        for i in 0 ..< 10 {
            let price : Double = 5.25 * Double(i)
            let product : Product = Product(name: "Price: \(price)", price: price)
            toReturn.append(product)
        }
        return toReturn
    }
    
    
}
