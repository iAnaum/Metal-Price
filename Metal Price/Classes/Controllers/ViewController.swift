//
//  ViewController.swift
//  Metal Price
//
//  Created by Anaum Hamid on 9/9/18.
//  Copyright © 2018 Anaum Hamid. All rights reserved.
//

import UIKit
import DropDown
import Alamofire
import SwiftyJSON
import Foundation
import MBProgressHUD


class ViewController: UIViewController {
    
    //UI Variables
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var Weight: UIButton!
    @IBOutlet weak var Currency: UIButton!
    @IBOutlet weak var Metal: UIButton!
    
    //Class Variable
    var properties = [Property]()
    var array = JSON()
    var MetalValues = [[String:AnyObject]]()
    let WeightDropDown = DropDown()
    let CurrencyDropDown = DropDown()
    let MetalDropDown = DropDown()
    
    lazy var dropDowns: [DropDown] = {
        return [
            self.WeightDropDown,
            self.CurrencyDropDown,
            self.MetalDropDown
        ]
    }()
    
    // Actions
    
    @IBAction func chooseWeight(_ sender: AnyObject) {
        WeightDropDown.show()
    }
    
    @IBAction func changeCurrency(_ sender: AnyObject) {
        CurrencyDropDown.show()
    }
    
    @IBAction func changeMetal(_ sender: AnyObject) {
        MetalDropDown.show()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupDropDowns()
        dropDowns.forEach { $0.dismissMode = .onTap }
        dropDowns.forEach { $0.direction = .any }
        tableView.register(UINib(nibName: "Price_TableViewCell", bundle:nil), forCellReuseIdentifier: "quote")

    }
    
    func setupDropDowns() {
        setupWeightDropDown()
        setupCurrencyDropDown()
        setupMetal()
    }
    
    func setupWeightDropDown() {
        WeightDropDown.anchorView = Weight
        WeightDropDown.bottomOffset = CGPoint(x: 0, y: Weight.bounds.height)
        
        WeightDropDown.dataSource = [
            "KG",
            "Ounces"
        ]
        
        // Action triggered on selection
        WeightDropDown.selectionAction = { [weak self] (index, item) in
            self?.Weight.setTitle(item, for: .normal)
        }
    }
    
    func setupCurrencyDropDown() {
        CurrencyDropDown.anchorView = Currency
        CurrencyDropDown.bottomOffset = CGPoint(x: 0, y: Currency.bounds.height)
        
        CurrencyDropDown.dataSource = [
            "USD",
            "CAD",
            "AED",
            "EUR",
            "PKR"
        ]
        
        // Action triggered on selection
        CurrencyDropDown.selectionAction = { [weak self] (index, item) in
            self?.Currency.setTitle(item, for: .normal)
        }
    }
    
    func setupMetal() {
        
        let URL = AppURLs.DashboardOZ
            MBProgressHUD.showAdded(to: self.view, animated: true)
            
            Alamofire.request(URL).responseJSON { response in
                
                print(response.request as Any)  // original URL request
                print(response.response as Any) // HTTP URL response
                print(response.data as Any)     // server data
                print(response.result as Any)   // result of response serialization
                
                let json = try? JSON(data: response.data!)
                print(json ?? "do nothing")
                self.MetalValues = json?.arrayObject as! [[String : AnyObject]]
                self.array = json!
                print(self.array)
        }
    

    }
    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "Price_TableViewCell") as? Price_TableViewCell
        cell?.setupCell(property: properties[index])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}


