//
//  Order.swift
//  StrategyPatternSwift
//
//  Created by Jonathan Ngabo on 2021-02-17.
//

import Foundation


public class Order : NSObject{
    var id: String?
    var totalCost: Double = 0.0
    var isClosed: Bool = false
    
    convenience init(totalCost : Double, isClosed : Bool ) {
        self.init()
        self.totalCost = totalCost
        self.isClosed = isClosed
        self.id = UUID().uuidString
    }
    
    
    func processOrder(strategy : PayStrategyPattern){
        strategy.collectPaymentDetails()
        /*
         Here we could collect and store payment data from the strategy.
         */
    }
    
    
}
