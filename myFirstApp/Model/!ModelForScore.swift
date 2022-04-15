//
//  ModelForScore.swift
//  myFirstApp
//
//  Created by Александр Мараенко on 29.03.2022.
//

import Foundation





// Поскольку UserDefoults по умолчанию может хранить только простые типы, такие как Int, String, Bool, Date и т.д.
// создаем модель на основе кастомного типа для хранения в ней пользовательских данных, в том числе имен пользователей,
// настроек цветовой палитры интерфейса и очков набраных за каждое задание в отдельности
//
// реализовав обязательные методы протокола NSCoding мы добавляем классу функционал для архивирования и разархивирования
// самого себя для последующей передачи переменной этого класса в UserDefoults для хранения


//class UserSettinsAndScore : NSObject, NSCoding {
//    
//    // создадим перечисление для хранения ключей для (архивации)?
//    fileprivate enum UserSettinsAndScoreKey {
//        static let UserDataKey = "UserDataKey"
//    }
//    
//    // реализуем обязательные методы протокола NSCoding
//    func encode(with coder: NSCoder) {
//        coder.encode(userScore.self , forKey: UserSettinsAndScoreKey.UserDataKey)
//    }
//    
//    required init?(coder: NSCoder) {
//        userScore = coder.decodeObject(forKey: UserSettinsAndScoreKey.UserDataKey) as! UserDefaults
//    }
//    
//}
