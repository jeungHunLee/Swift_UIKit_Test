//
//  ViewController.swift
//  Alert
//
//  Created by 이정훈 on 2022/08/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var IDTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        passwordTextField.isSecureTextEntry = true    //password를 입력하는 text field 보이지 않게 처리
    }

    @IBAction func btnGo(_ sender: UIButton) {
        //id 혹은 password 중 올바른 형식이 아니리면 alert 발생
        if IDTextField.text!.count == 0 || passwordTextField.text!.count == 0 {
            let invalidAlert = UIAlertController(title: "올바르지 않은 형식", message: "올바른 형식의 id와 password를 입력해 주세요.", preferredStyle: UIAlertController.Style.alert)
            
            let confirm = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)    //특별한 동작을 수행하지 않으므로 handler는 nil
            
            invalidAlert.addAction(confirm)
            
            present(invalidAlert, animated: true, completion: nil)
        } else {
            let wellcomeAlert = UIAlertController(title: "로그인", message: "\(IDTextField.text!)님 환영합니다!", preferredStyle: UIAlertController.Style.alert)
            
            let confirm = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: { action in
                self.IDTextField.text! = ""
                self.passwordTextField.text! = ""
            })
            
            wellcomeAlert.addAction(confirm)
            
            present(wellcomeAlert, animated: true, completion: nil)
        }
    }
}

