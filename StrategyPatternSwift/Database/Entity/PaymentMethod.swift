//
//  PaymentMethod.swift
//  StrategyPatternSwift
//
//  Created by Jonathan Ngabo on 2021-02-17.
//

import Foundation


public class PaymentMethod : NSObject{
    var id: String?
    var name: String = ""
    var isSelected : Bool = false
    convenience init(name : String ) {
        self.init()
        self.name = name
        self.id = UUID().uuidString
    }
     
}
