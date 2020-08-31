//
//  Authorization.swift
//  HW2.2.4
//
//  Created by Геннадий Красношлык on 29.08.2020.
//  Copyright © 2020 Aquesta's. All rights reserved.
//

struct Login {
    let login: String
    let password: String
    let person: Person

    init() {
        self.login = "Gennady"
        self.password = "1"
        self.person = Person()
    }
}
