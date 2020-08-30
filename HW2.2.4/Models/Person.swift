//
//  Person.swift
//  HW2.2.4
//
//  Created by Геннадий Красношлык on 30.08.2020.
//  Copyright © 2020 Aquesta's. All rights reserved.
//

struct Person {
    let name:String
    let age:Int
    let description:String
    let wife:Family
    let son:Family
    let photo:String
    
    init(){
        self.name = "Геннадий"
        self.age = 36
        self.description = "Something about me..."
        self.wife = Family(name: "Ольга", age: 38, description: "Something about my wife", photo: "wife.jpg")
        self.son = Family(name: "Егор", age: 9, description: "Something about my son", photo: "son.jpg")
        self.photo =  "me.jpg"
    }
}



