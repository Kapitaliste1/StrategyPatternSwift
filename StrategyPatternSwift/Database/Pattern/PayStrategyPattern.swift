//
//  PayStrategyPattern.swift
//  StrategyPatternSwift
//
//  Created by Jonathan Ngabo on 2021-02-17.
//

import Foundation

protocol PayStrategyPattern {
    func pay(paymentAmount : Double,successHandler : @escaping (String) -> Void, failureHandler : @escaping (String) -> Void)
    func collectPaymentDetails()
}
