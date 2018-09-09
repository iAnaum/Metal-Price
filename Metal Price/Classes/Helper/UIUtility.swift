//
//  UIUtility.swift
//  Radius
//
//  Created by Minhasoft on 2/26/18.
//  Copyright © 2018 Minhasoft. All rights reserved.
//

import Foundation
import UIKit

class UIUtility: NSObject {
    
    static let sharedInstance: UIUtility = UIUtility()
    
    /// Applies shadow to view
    /// - Parameter view: UIView
    /// - Parameter shadowColorOpacity: CGFloat
    /// - Parameter shadowOffset: CGSize
    /// - Parameter shadowOpacity: Float
    /// - Parameter colorCode: String
    func applyShadow(toView view: UIView, shadowColorOpacity: CGFloat, shadowOffset: CGSize, shadowOpacity: Float, colorCode: String) {
        let shadowPath = UIBezierPath(rect: view.bounds)
        view.layer.masksToBounds = false
        view.layer.shadowColor = ThemeEngine.sharedInstance.colorWithHexString(hexString: colorCode, opacity: shadowColorOpacity).cgColor
        view.layer.shadowOffset = shadowOffset
        view.layer.shadowOpacity = shadowOpacity
        view.layer.shadowPath = shadowPath.cgPath
    }
    
    /// Applies shadow to view
    /// - Parameter view: UIView
    /// - Parameter shadowColorOpacity: CGFloat
    /// - Parameter shadowOffset: CGSize
    /// - Parameter shadowRadius: CGFloat
    func applyShadow(toView view: UIView, shadowColorOpacity: CGFloat, shadowOffset: CGSize, shadowRadius: CGFloat) {
        view.layer.shadowColor = ThemeEngine.sharedInstance.colorWithHexString(hexString: "000000", opacity: shadowColorOpacity).cgColor
        view.layer.shadowOffset = shadowOffset
        view.layer.shadowOpacity = 1.0
        view.layer.shadowRadius = shadowRadius
        view.layer.masksToBounds = false
    }
    
    
    /// Applies shadow to view
    /// - Parameter view: UIView
    /// - Parameter shadowColorOpacity: CGFloat
    func applyShadow(toView view: UIView) {
        view.layer.shadowColor = ThemeEngine.sharedInstance.colorWithHexString(hexString: "000000", opacity: 0.25).cgColor
        view.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        view.layer.shadowOpacity = 1.0
        view.layer.shadowRadius = 0.0
        view.layer.masksToBounds = false
    }
    
    
    /// Shows alert for no internet connection
    /// - Parameter viewController: UIViewController
    func showAlertForNoInternet(viewController: UIViewController) {
        let alertController = UIAlertController(title: Constants.AlertTitle.error.rawValue, message: Constants.Message.checkInternet.rawValue, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
            print("OK")
        }
        
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    
    /// Shows alert
    /// - Parameter viewController: UIViewController
    /// - Parameter title: String
    /// - Parameter message: String
    func showAlert(viewController: UIViewController, title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
            print("OK")
        }
        
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    /// Shows alert
    /// - Parameter viewController: UIViewController
    /// - Parameter title: Constants.AlertTitle
    /// - Parameter message: String
    func showAlert(viewController: UIViewController, title: Constants.AlertTitle, message: String) {
        let alertController = UIAlertController(title: title.rawValue, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
            print("OK")
        }
        
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    /// Shakes view
    /// - Paramter view: UIView
    func shakeView(view: UIView) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: view.center.x - 10, y: view.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: view.center.x + 10, y: view.center.y))
        view.layer.add(animation, forKey: "position")
    }
}
