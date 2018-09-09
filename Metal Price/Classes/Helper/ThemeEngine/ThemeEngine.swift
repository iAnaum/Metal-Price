//
//  ThemeEngine.swift
//  Radius
//
//  Created by Minhasoft on 2/22/18.
//  Copyright © 2018 Minhasoft. All rights reserved.
//

import Foundation
import UIKit

class ThemeEngine: NSObject {
    
    static let sharedInstance: ThemeEngine = ThemeEngine()
    
    
    func themeOrangeColor()-> UIColor {
        return self.colorWithHexString(hexString: "F8961C")
    }
    
    func themeRedColor()-> UIColor {
        return self.colorWithHexString(hexString: "EE4A22")
    }
    
    /// Converts Hex String to UIColor
    /// - Parameter hexString: String
    /// - Parameter opacity: CGFloat
    /// - Returns: UIColor
    func colorWithHexString(hexString: String, opacity: CGFloat)-> UIColor {
        
        // Convert hex string to an integer
        let hexint = Int(self.intFromHexString(hexStr: hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: opacity)
        return color
    }
    
    /// Converts Hex String to UIColor
    /// - Parameter hexString: String
    /// - Returns: UIColor
    func colorWithHexString(hexString: String)-> UIColor {
        
        // Convert hex string to an integer
        let hexint = Int(self.intFromHexString(hexStr: hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        return color
    }
    
    func intFromHexString(hexStr: String)-> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexStr)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = NSCharacterSet(charactersIn: "#") as CharacterSet
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
    
}
