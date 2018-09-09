//
//  Constants.swift
//  Radius
//
//  Created by Minhasoft on 2/26/18.
//  Copyright © 2018 Minhasoft. All rights reserved.
//

import Foundation

class Constants {
    
    static let PaymentMethods = ["IBFT", "Cash Deposit"]
    
    enum UserRole {
        case buyer
        case seller
    }
    
    enum AlertTitle: String {
        case alert = "Alert"
        case error = "Error"
    }
    
    enum Message: String {
        case checkInternet = "Please check your internet connection"
        case enterValidEmail = "Please enter valid email address"
        case passwordDontMatch = "Passwords do not match with Confirm Password"
        case profileUpdated = "Profile updated successfully"
        case numberFormat = "Cell Number format should be 3001234567"
        case oldPasswordDontMatch = "Password do not match with old password"
        case deleteAlert = "Are you sure you want to delete this?"
        case takeSnapshot = "Please provide snapshot of your receipt"
        
        case somethingWentWrong = "Something went wrong"
    }
    
    enum UserDefaultsKey: String {
        case userID = "UserID"
        case firstTimeLogin = "IsFirstTimeLogin"
    }
    
    enum SubProjectType: String {
        case nested = "Nested"
        case cascaded = "Cascaded"
    }

}
