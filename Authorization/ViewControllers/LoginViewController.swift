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
    private var biography = Biography.getBiography()
    
    // MARK: Viev life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 15
        userNameTF.text = biography.login.result
        passwordTF.text = biography.password.result
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBC = segue.destination as? UITabBarController else { return }
        guard let viewScreens = tabBC.viewControllers else { return }
        
        viewScreens.forEach { viewController in
            if let welcomVC  = viewController as? WelcomeViewController {
                welcomVC.helloText = biography.name.definition
            } else if let navigationVC = viewController as? UINavigationController {
                guard let userVC = navigationVC.topViewController as? UserViewController else { return }
                userVC.username = biography.name.definition
                userVC.surname = biography.surname.definition
                userVC.hobbies = biography.enthusiasm.definition
            }
        }
    }
    
    // MARK: IB Action
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""

    }

    @IBAction func goesToAnotherScreen(_ sender: UIButton) {
        if userNameTF.text == biography.login.result && passwordTF.text == biography.password.result {
            performSegue(withIdentifier: "goToTheNextScreen", sender: nil)
        } else {
            displaysAlert("Invalid login or password", "Please, enter correct login and password", passwordTF)
        }
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? displaysAlert("Oops", "Your name is \(biography.login.result)")
        : displaysAlert("Oops", "Your password is \(biography.password.result)")
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


