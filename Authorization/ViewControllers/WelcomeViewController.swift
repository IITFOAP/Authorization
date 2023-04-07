//
//  WelcomeViewController.swift
//  Authorization
//
//  Created by Рома Баранов on 31.03.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet var helloLabel: UILabel!
    @IBOutlet var usernameLable: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.makesBackgroundGradient()
        helloLabel.text = "Welcome, \(user.login)!"
        usernameLable.text = "Мое имя \(user.person.fullName)"
    }
}

