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
    
    // MARK: Viev life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 15
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let helloUser = segue.destination as? WelcomeViewController else { return }
        helloUser.helloLableText = userNameTF.text
    }
    
    // MARK: IB Action
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
        
    }
    
    @IBAction func goesToAnotherScreen(_ sender: UIButton) {
        let username = userNameTF.text ?? ""
        let password = passwordTF.text ?? ""
        
        if username == "Roman" && password == "Password" {
            performSegue(withIdentifier: "goToTheNextScreen", sender: self)
        } else {
            displaysWarningForData("Invalid login or password", "Please, enter correct login and password")
        }
    }
    
    @IBAction func printsTheUsername(_ sender: UIButton) {
        displaysAlert("Oops", "Your name is Roman")
    }
    
    @IBAction func displaysTheUsersPassword(_ sender: UIButton) {
        displaysAlert("Oops", "Your password is Password")
    }
    
    // MARK: Private Methods
    private func displaysAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    private func displaysWarningForData(_ title: String, _ massage: String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAlert = UIAlertAction(title: "OK", style: .default) {_ in
            self.passwordTF.text = "" }
        alert.addAction(okAlert)
        present(alert, animated: true)
    }
}

    //очень долго думал, почему не менялось название фала в левой колонке

