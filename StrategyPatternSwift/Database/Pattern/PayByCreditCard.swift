//
//  PayByCreditCard.swift
//  StrategyPatternSwift
//
//  Created by Jonathan Ngabo on 2021-02-17.
//

import Foundation


class PayByCreditCard: PayStrategyPattern {
    
    private var creditCard : Card?
    
    func pay(paymentAmount: Double, successHandler: @escaping (String) -> Void, failureHandler: @escaping (String) -> Void) {
        if self.cardIsPresent() {
            /*
             User's credit card information was provided
             and we can implement the apropriate code to proceed with the payment
             */
            successHandler("Paid amount of : \(paymentAmount) using Credit Card.")
        }else{
            failureHandler("No credit card was found.")
        }
    }
    
    
    public func collectPaymentDetails() {
        /*
         We can show a customized view here in order to collect the credit card information
         and create a new instance of a credit card.
         We are going to use static information just for the example.
         */
        self.creditCard = Card(cardNumber: "42492849249284294", expirationDate: "12/22", cvv: 123)
    }
    
    private func cardIsPresent() -> Bool {
        /*
         We check if the user has provided a credit card information.
         */
        return self.creditCard != nil
    }
    
}
