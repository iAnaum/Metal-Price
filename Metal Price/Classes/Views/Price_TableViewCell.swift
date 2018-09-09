//
//  Price_TableViewCell.swift
//  Metal Price
//
//  Created by Anaum Hamid on 9/9/18.
//  Copyright © 2018 Anaum Hamid. All rights reserved.
//

import UIKit

class Price_TableViewCell: UITableViewCell {

    /// UI Variables
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lbldate: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblCurrency: UILabel!
    @IBOutlet weak var lblUnit: UILabel!
   
    
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.clear
        self.selectionStyle = .none
    }
    
    func setupCell(property: Property) {
        lblName.text = property.Name
        lbldate.text = property.Date
        
        lblTime.text = property.Time
        lblUnit.text = property.Unit
        
        lblPrice.text = property.Ask
        lblCurrency.text = property.Currency
        
    }
    
}
