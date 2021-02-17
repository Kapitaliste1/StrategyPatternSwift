//
//  ViewController.swift
//  StrategyPatternSwift
//
//  Created by Jonathan Ngabo on 2021-02-17.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentAmountLabel: UILabel!
    var currentOrder : Order?
    @IBOutlet weak var tableView: UITableView!
    var productArray : [Product] = [Product]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.registerCells()
    }
    
    fileprivate func registerCells(){
        self.currentOrder = Order()
        self.productArray = self.getDummyArray()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let cell = UINib(nibName: ProductTableViewCell.identifier, bundle:nil)
        self.tableView.register(cell,forCellReuseIdentifier: ProductTableViewCell.identifier)
        self.tableView.reloadData()
    }
    
    
    @IBAction func payAction(_ sender: Any) {
        
    }
    
    
}


//MARK:- Tableview delegate implementation
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if let productCell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier) as? ProductTableViewCell{
            productCell.product = self.productArray[indexPath.row]
            cell = productCell
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.productArray[indexPath.row].isSelected = !self.productArray[indexPath.row].isSelected
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        if let order = self.currentOrder{
            if self.productArray[indexPath.row].isSelected{
                order.totalCost += self.productArray[indexPath.row].price
            }else if !self.productArray[indexPath.row].isSelected && order.totalCost >= self.productArray[indexPath.row].price {
                order.totalCost -= self.productArray[indexPath.row].price
            }
            self.currentAmountLabel.text = order.totalCost.description
        }
    }
}


//MARK:- Generate dummy data
extension ViewController{
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
