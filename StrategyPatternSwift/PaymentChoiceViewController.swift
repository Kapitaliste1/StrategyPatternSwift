//
//  PaymentChoiceViewController.swift
//  StrategyPatternSwift
//
//  Created by Jonathan Ngabo on 2021-02-17.
//

import UIKit

class PaymentChoiceViewController: UIViewController {
    var paymentMethodArray : [PaymentMethod] = [PaymentMethod]()
    var currentOrder : Order?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCells()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func registerCells(){
        self.paymentMethodArray = self.generatePaymentMethods()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let cell = UINib(nibName: PaymentTableViewCell.identifier, bundle:nil)
        self.tableView.register(cell,forCellReuseIdentifier: PaymentTableViewCell.identifier)
        self.tableView.reloadData()
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func payAction(_ sender: Any) {
        
        if let order = self.currentOrder, let selectedPaymentMethod = self.paymentMethodArray.filter({ $0.isSelected == true }).first{
            var body : String = ""

            let alertController = UIAlertController(title: "Alert", message: body, preferredStyle: .alert)

            switch selectedPaymentMethod.name {
            case "PayPal":
                order.processOrder(strategy: PayByPayPal.shared)
                PayByPayPal.shared.pay(paymentAmount: order.totalCost) { (success) in
                    body = success
                } failureHandler: { (error) in
                    body = error
                }
                break
            case "Credit Card":
                order.processOrder(strategy: PayByCreditCard.shared)
                PayByCreditCard.shared.pay(paymentAmount: order.totalCost) { (success) in
                    body = success
                } failureHandler: { (error) in
                    body = error
                }

                break
            default:
                body = "Select a payment method."
                break
            }
            
            let reloadAction = UIAlertAction(title: "Dismiss", style: .destructive) { (action:UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(reloadAction)
            alertController.message = body
            self.present(alertController, animated: true, completion: nil)

        }
        
        
        
        

    }
    
}


//MARK:- Tableview delegate implementation
extension PaymentChoiceViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if let paymentMethodCell = tableView.dequeueReusableCell(withIdentifier: PaymentTableViewCell.identifier) as? PaymentTableViewCell{
            paymentMethodCell.paymentMethod = self.paymentMethodArray[indexPath.row]
            cell = paymentMethodCell
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.paymentMethodArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.paymentMethodArray.forEach({ $0.isSelected = false })
        self.paymentMethodArray[indexPath.row].isSelected = true
        self.tableView.reloadData()
    }
}


//MARK:- creating list of available payment methods
extension PaymentChoiceViewController {
    func generatePaymentMethods() -> [PaymentMethod] {
        var toReturn : [PaymentMethod] = [PaymentMethod]()
        let payPal = PaymentMethod(name: "PayPal")
        let creditCard = PaymentMethod(name: "Credit Card")
        toReturn.append(payPal)
        toReturn.append(creditCard)
        return toReturn
    }
}
