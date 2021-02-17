//
//  PayByPayPal.swift
//  StrategyPatternSwift
//
//  Created by Jonathan Ngabo on 2021-02-17.
//

import Foundation

class PayByPayPal: PayStrategyPattern {
   
    private var isSignedIn : Bool = false
    
    
    func pay(paymentAmount: Double, successHandler: @escaping (String) -> Void, failureHandler: @escaping (String) -> Void) {
        if self.isSignedIn {
            /*
             User's PayPal account was verified
             and proceed with the payment by implementing the necessary code
             */
            successHandler("Paid amount of : \(paymentAmount) using PayPal.")
        }else{
            failureHandler("The user is not signed in")
            
        }
    }
   
    
    public func collectPaymentDetails() {
        if self.verify() {
            /*
             User's PayPal account was verified
             Proceed to coll
             */
            
        }else{
            /*
             Authentication process went wrong
             */
        }
    }
    
    private func verify() -> Bool {
        if self.isSignedIn{
            /*
             We return the is signed in status if the user's PayPal account is already verified/connected
             */
            return self.isSignedIn
        }else{
            /*
             Here you can implement the PayPal authentication and save the status along with needed informations for later
             */
            self.isSignedIn = true
            return self.isSignedIn
        }
    }
    
    
}
