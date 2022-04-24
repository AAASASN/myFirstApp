//
//  NewModelArray.swift
//  myFirstApp
//
//  Created by Александр Мараенко on 31.03.2022.
//

import Foundation

class UsersArray {
    
    var usersArray = [User]()
    
    let userDefaults = UserDefaults.standard
    
    
    //    // при инициализации элемента класса в массив usersArray будут набиваится четыре пустых элемента типа User
    //    init() {
    //        let u = User(name: "", score: "")
    //        self.usersArray.append(u)
    //        self.usersArray.append(u)
    //        self.usersArray.append(u)
    //        self.usersArray.append(u)
    //    }
    
    init() {
        getUsersArrayFromUserDefaults()
    }
    
                  
        // метод который при будем вызывать после создании экземпляра класса UsersArray и сохранять массив
        // usersArray в UserDefaults
        func setUsersArrayToUserDefaults(){
            userDefaults.set(usersArray, forKey: "userArrayKey")
        }
                  
        // метод который будет вытаскивать из UserDefaults наш массив [User]
        func getUsersArrayFromUserDefaults() {
            if let uA = (userDefaults.object(forKey: "userArrayKey")) {
                self.usersArray = uA as! [User]
            } else {
                self.usersArray = [User]()
            }
        }
                  
        // метод для проверки есть ли пользователь с именем string в массиве usersArray нашего класса UsersArray
        func isItemInArrayInClassUsersArray(string : String) -> Bool{
            var usersCount = 0
            for item in usersArray {
                if item.name == string {
                    usersCount += 1
                }
            }
            if usersCount > 0 {
                return true
            } else {
                return false
            }
        }
                  
        // метод который будет добавлять пользователя в массив usersArray нашего класса UsersArray и затем сразу сортировать его
        func addUserToUsersArrayAndSort(user : User) {
            usersArray.append(user)
            let uaSorted = usersArray.sorted {
                (p1, p2) -> Bool in p1.name > p2.name
            }
            usersArray = uaSorted
        }
                  
        // напишем функцию которая будет добавлять элемент в массив и сразу сортировать его (не используется)
        func addUserToUsersArrayAndSort (usersArray: [User], user: User) -> [User]{
            var ua = usersArray
            let u = user
            ua.append(u)
            let uaSorted = ua.sorted {
                (p1, p2) -> Bool in p1.name < p2.name
            }
            return uaSorted
        }
                  
}
                
