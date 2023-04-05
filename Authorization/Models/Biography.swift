//
//  Biography.swift
//  Authorization
//
//  Created by Рома Баранов on 04.04.2023.
//


struct Biography {
    let name: Person
    let surname: Person
    let enthusiasm: Person
    let biography: Person
    let login: User
    let password: User
    
    static func getBiography() -> Biography {
        Biography(
            name: .name,
            surname: .surname,
            enthusiasm: .enthusiasm,
            biography: .biography,
            login: .login,
            password: .password)
    }
}

enum User {
    case login
    case password
    
    var result: String {
        switch self {
        case .login:
            return "Roman"
        case .password:
            return "Password "
        }
    }
}

enum Person {
    case name
    case surname
    case enthusiasm
    case biography
    
    var definition: String {
        switch self {
        case .name:
            return "Роман"
        case .surname:
            return "Баранов"
        case .enthusiasm:
            return "Мотоциклы"
        case .biography:
            return "Я Баранов Роман, молодой и энергичный человек, которому увлечение мотоциклами стало настоящей страстью ещё в детстве. Когда мне исполнилось 15 лет, родители подарили мне первый мотоцикл, это был небольшой, но мощный байк, который дал мне возможность почувствовать настоящую свободу и ускорение. Моя любовь к мотоциклам не только не угасла со временем, но и продолжает расти с каждым днем. Я стремлюсь к новым достижениям и настоящим вызовам, которые я готов принимать на своем пути, продолжая жить своей мечтой и наслаждаться жизнью."
        }
    }
}
