//
//  UserViewController.swift
//  Authorization
//
//  Created by Рома Баранов on 05.04.2023.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var hobbiesLabel: UILabel!
    
    @IBOutlet var userPhoto: UIImageView!
    
    var username = ""
    var surname = ""
    var hobbies = ""
    var biographyText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = "Имя: \(username)"
        surnameLabel.text = "Фамилия: \(surname)"
        hobbiesLabel.text = "Увлечения: \(hobbies)"
        
    }
    override func viewWillLayoutSubviews() {
        userPhoto.layer.cornerRadius = userPhoto.frame.width / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let biographyVC = segue.destination as? BiographyViewController else { return }
        biographyVC.biography = biographyText
    }
}
