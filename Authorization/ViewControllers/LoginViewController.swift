//
//  LoginViewController.swift
//  Authorization
//
//  Created by Рома Баранов on 31.03.2023.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    
    private var person = Biography.getBiography()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 15
        userNameTF.text = person.login.result
        passwordTF.text = person.password.result
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
                welcomVC.helloText = person.login.result
                welcomVC.nameText = person.name.definition
                welcomVC.surnameText = person.surname.definition
            } else if let navigationVC = viewController as? UINavigationController {
                guard let userVC = navigationVC.topViewController as? UserViewController else { return }
                userVC.username = person.name.definition
                userVC.surname = person.surname.definition
                userVC.hobbies = person.enthusiasm.definition
                userVC.biographyText = person.biography.definition
                }
            }
        }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""

    }

    @IBAction func goesToAnotherScreen(_ sender: UIButton) {
        if userNameTF.text == person.login.result && passwordTF.text == person.password.result {
            performSegue(withIdentifier: "goToTheNextScreen", sender: nil)
        } else {
            displaysAlert("Invalid login or password", "Please, enter correct login and password", passwordTF)
        }
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? displaysAlert("Oops", "Your name is \(person.login.result)")
        : displaysAlert("Oops", "Your password is \(person.password.result)")
    }
    
    private func displaysAlert(_ title: String, _ message: String, _ textFild: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAlert = UIAlertAction(title: "OK", style: .default) {_ in
            textFild?.text = ""
        }
        alert.addAction(okAlert)
        present(alert, animated: true)
    }
}


