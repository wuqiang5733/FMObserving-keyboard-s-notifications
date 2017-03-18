//
//  ViewController.swift
//  Observing keyboard's notifications
//
//  Created by WuQiang on 2017/3/18.
//  Copyright © 2017年 WuQiang. All rights reserved.
//




import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightBottom: NSLayoutConstraint!
    @IBOutlet weak var mainText: UITextView!
    var constraintHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintHeight = heightBottom.constant
        
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(openKeyboard(notification:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
        center.addObserver(self, selector: #selector(closeKeyboard(notification:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    func openKeyboard(notification: Notification) {
        if let info = notification.userInfo {
            let value = info[UIKeyboardFrameEndUserInfoKey] as! NSValue
            let frame = value.cgRectValue
            let newHeight = frame.size.height + constraintHeight
            heightBottom.constant = newHeight
        }
    }
    func closeKeyboard(notification: Notification) {
        heightBottom.constant = constraintHeight
    }
    @IBAction func saveText(_ sender: UIButton) {
        mainText.resignFirstResponder()
    }
}
