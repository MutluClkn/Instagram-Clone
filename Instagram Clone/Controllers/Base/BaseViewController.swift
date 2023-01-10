//
//  BaseViewController.swift
//  Instagram Clone
//
//  Created by Mutlu Çalkan on 6.01.2023.
//

//MARK: - Frameworks
import UIKit

//MARK: - UIViewController
class BaseViewController: UIViewController {
    
    //-----------------------------
    //MARK: - Alert Message
    //-----------------------------
    
    func alertMessage(alertTitle: String, alertMesssage: String) {
        let alertController = UIAlertController(title: alertTitle, message: alertMesssage, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
    }
    
    func confirmAlertSheet(alertTitle: String, alertMesssage: String, actionTitle: String, style: UIAlertAction.Style ,handler: ((UIAlertAction) -> Void)?){
        let alertController = UIAlertController(title: alertTitle, message: alertMesssage, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alertController.addAction(UIAlertAction(title: actionTitle, style: style, handler: handler))
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
