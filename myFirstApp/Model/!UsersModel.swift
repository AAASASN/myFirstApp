//
//  UsersModel.swift
//  myFirstApp
//
//  Created by Александр Мараенко on 30.03.2022.
//

import Foundation

class UsersModel: NSObject, NSCoding {
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(score, forKey: "score")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as?  String ?? ""
        score = coder.decodeObject(forKey: "score") as? Int ?? 0
    }
     
    var name : String = "Sasha"
    var score : Int = 0
    
//    init(name: String, score: Int) {
//        self.name = "Sasha"
//        self.score = 0
//    }
}

