//
//  BiographyViewController.swift
//  Authorization
//
//  Created by Рома Баранов on 05.04.2023.
//

import UIKit

final class BiographyViewController: UIViewController {
    @IBOutlet var biographyLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.person.fullName
        biographyLabel.text = user.person.biography
    }
}
