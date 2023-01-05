//
//  UIViewController.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 5.01.2023.
//

import UIKit

//MARK: - UIViewController
extension UIViewController {
    
    
    //-----------------------------
    //MARK: - Alert Message
    //-----------------------------
    
    func alertMessage(alertTitle: String, alertMesssage: String) {
        let alertController = UIAlertController(title: alertTitle, message: alertMesssage, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
    }
    
    
    //-----------------------------
    //MARK: - Hide Keyboard
    //-----------------------------
    
    func hideKeyboard(){
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardPressed))
        view.addGestureRecognizer(gestureRecognizer)
    }
    @objc private func hideKeyboardPressed(){
        view.endEditing(true)
    }
}
