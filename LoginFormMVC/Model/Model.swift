//
//  Model.swift
//  LoginFormMVC
//
//  Created by Кирилл Тараско on 01.05.2022.
//

struct User {
    var login: String
    var password: String
    var person: Person
    
    static func getPerson() -> User {
        User(login: "Kir", password: "123", person: Person.getPerson())
    }
}

struct Person {
    var name = "Kirill"
    var surname = "Tarasko"
    var description = "Junior IOS-Developer"
    
    static func getPerson() -> Person {
        Person()
    }
}
var someUser = User.getPerson()
var human = Person.getPerson()

var fullname = human.name + " " + human.surname
