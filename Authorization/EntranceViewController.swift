//
//  EntranceViewController.swift
//  Authorization
//
//  Created by Рома Баранов on 31.03.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: IB Outlets
    @IBOutlet var helloLabel: UILabel!
    
    // MARK: Properties
    var helloLableText: String?
    
    // MARK: Viev life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makesBackgroundGradient()
        helloLabel.text = "Welcome, \(helloLableText ?? "")!"
    }
    
    // MARK: Private Methods
    private func makesBackgroundGradient() {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.green.cgColor]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        
        gradientLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
