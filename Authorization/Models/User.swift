//
//  User.swift
//  Authorization
//
//  Created by Рома Баранов on 04.04.2023.
//


struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            login: "Alexey",
            password: "Password",
            person: Person.getPerson()
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let enthusiasm: String
    let biography: String
    
    var fullName: String {
        "\(surname) \(name)"
    }
    
    static func getPerson() -> Person {
        Person(
            name: "Роман",
            surname: "Баранов",
            enthusiasm: "Мотоциклы",
            biography: "Я Баранов Роман, молодой и энергичный человек, которому увлечение мотоциклами стало настоящей страстью ещё в детстве. Когда мне исполнилось 15 лет, родители подарили мне первый мотоцикл, это был небольшой, но мощный байк, который дал мне возможность почувствовать настоящую свободу и ускорение. Моя любовь к мотоциклам не только не угасла со временем, но и продолжает расти с каждым днем. Я стремлюсь к новым достижениям и настоящим вызовам, которые я готов принимать на своем пути, продолжая жить своей мечтой и наслаждаться жизнью."
        )
    }
}

