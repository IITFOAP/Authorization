//
//  Extension + UI.swift
//  Authorization
//
//  Created by Рома Баранов on 07.04.2023.
//

import UIKit

// MARK: - Set background color
extension UIView {
    func makesBackgroundGradient() {
        let primaryColor = UIColor(
            red: 210/255,
            green: 109/225,
            blue: 128/255,
            alpha: 1
        )
        
        let secondaryColor = UIColor(
            red: 107/255,
            green: 148/255,
            blue: 230/255,
            alpha: 1)
        
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [primaryColor.cgColor, secondaryColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}

private extension UIView {
    func backgroundGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.blue.cgColor, UIColor.green.cgColor]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
