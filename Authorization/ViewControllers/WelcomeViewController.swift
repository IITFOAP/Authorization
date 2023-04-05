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
    
    var helloText = ""
    var nameText = ""
    var surnameText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makesBackgroundGradient()
        helloLabel.text = "Welcome, \(helloText)!"
        usernameLable.text = "Мое имя \(surnameText) \(nameText)"
    }
    
    private func makesBackgroundGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.blue.cgColor, UIColor.green.cgColor]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

