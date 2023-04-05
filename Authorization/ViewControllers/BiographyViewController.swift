//
//  BiographyViewController.swift
//  Authorization
//
//  Created by Рома Баранов on 05.04.2023.
//

import UIKit

final class BiographyViewController: UIViewController {
    @IBOutlet var biographyLabel: UILabel!
    
    var biography = "vhjhjhg"
    override func viewDidLoad() {
        super.viewDidLoad()
        biographyLabel.text = biography
    }
}
