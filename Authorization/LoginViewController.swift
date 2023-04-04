//
//  LoginViewController.swift
//  Authorization
//
//  Created by Рома Баранов on 31.03.2023.
//

import UIKit

final class LoginViewController: UIViewController {

    // MARK: IB Outlets
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    
    // MARK: Private properties
    private let username = "Roman"
    private let password = "Password"
    
    // MARK: Viev life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 15
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let helloUser = segue.destination as? WelcomeViewController else { return }
        helloUser.helloText = username
    }
    
    // MARK: IB Action
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
        
    }
    
    @IBAction func goesToAnotherScreen(_ sender: UIButton) {
        if userNameTF.text == username && passwordTF.text == password {
            performSegue(withIdentifier: "goToTheNextScreen", sender: nil)
        } else {
            displaysAlert("Invalid login or password", "Please, enter correct login and password", passwordTF)
        }
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? displaysAlert("Oops", "Your name is \(username)")
        : displaysAlert("Oops", "Your password is \(password)")
    }
    
    
    // MARK: Private Methods
    private func displaysAlert(_ title: String, _ message: String, _ textFild: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAlert = UIAlertAction(title: "OK", style: .default) {_ in
            textFild?.text = ""
        }
        alert.addAction(okAlert)
        present(alert, animated: true)
    }
}


