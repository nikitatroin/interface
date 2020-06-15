//
//  ViewController.swift
//  VK
//
//  Created by Никита Троян on 14.06.2020.
//  Copyright © 2020 Никита Троян. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView:UIScrollView!
    @IBOutlet weak var loginTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    @IBAction func siginPressed (_ sender:UIButton){
        guard let login = loginTextField.text, let password = passwordTextField.text else {return}
        print("login\(login), password\(password)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @objc func keybordWillShow(notification:NotificationCenter){
        guard let kbSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
            else{return}
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
        
    }
    @objc func keybordWillHide(notification:NotificationCenter){
        scrollView.contentInset = .zero
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                NotificationCenter.default.addObserver(self,
                                               selector: #selector(keybordWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
                NotificationCenter.default.addObserver(self,
                                               selector: #selector(keybordWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    
    @IBAction func scrollTappes(_ gester:UITapGestureRecognizer){
        scrollView.endEditing(true)
    }
}

