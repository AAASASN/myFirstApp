//
//  User.swift
//  myFirstApp
//
//  Created by Александр Мараенко on 06.04.2022.
//
// // // //
import Foundation

class User {
    
    var name = String ()
    var score = String ()
    
    init(){

    }
    
    init(name: String, score: String) {
        self.name = name
        self.score = score
    }
    
    func setScore (name : String, score : String) {
        let defaults = UserDefaults.standard
        defaults.set(score, forKey: name)
        defaults.set(name, forKey: name)
    }
    
    func getScore (name : String) -> String {
        let defaults = UserDefaults.standard
        return String(defaults.integer(forKey: name))
    }
    
}
