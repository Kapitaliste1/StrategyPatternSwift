//
//  Card.swift
//  StrategyPatternSwift
//
//  Created by Jonathan Ngabo on 2021-02-17.
//

import Foundation

public class Card : NSObject{
    private var cardNumber : String = ""
    private var expirationDate : String = ""
    private var cvv : Int = 0
    
    convenience init(cardNumber : String, expirationDate : String, cvv : Int ) {
        self.init()
        self.cardNumber = cardNumber
        self.cvv = cvv
        self.expirationDate = expirationDate
    }
    
}
