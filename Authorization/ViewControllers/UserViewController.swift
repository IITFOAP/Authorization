//
//  UserViewController.swift
//  Authorization
//
//  Created by Рома Баранов on 05.04.2023.
//

import UIKit

final class UserViewController: UIViewController {
    
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var hobbiesLabel: UILabel!
    
    @IBOutlet var userPhoto: UIImageView!
    
    var user: User!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.makesBackgroundGradient()
        title = user.person.fullName
        usernameLabel.text = "Имя: \(user.person.name)"
        surnameLabel.text = "Фамилия: \(user.person.surname)"
        hobbiesLabel.text = "Увлечения: \(user.person.enthusiasm)"
        
    }
    override func viewWillLayoutSubviews() {
        userPhoto.layer.cornerRadius = userPhoto.frame.width / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let biographyVC = segue.destination as? BiographyViewController else { return }
        biographyVC.user = user
    }
}
