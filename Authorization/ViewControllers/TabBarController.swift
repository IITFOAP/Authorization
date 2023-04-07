//
//  TabBarController.swift
//  Authorization
//
//  Created by Рома Баранов on 06.04.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        transferData()
        
        tabBar.items?.last?.title = user.person.fullName
    }
    
    private func transferData() {
        guard let viewControllers else { return}
        
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                guard let userVC = navigationVC.topViewController as? UserViewController else {
                    return
                }
                userVC.user = user
            }
        }
    }
}
