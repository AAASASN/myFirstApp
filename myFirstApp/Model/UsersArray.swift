//
//  NewModelArray.swift
//  myFirstApp
//
//  Created by Александр Мараенко on 31.03.2022.
//

import Foundation

class UsersArray {
    
    var usersArray = [(name : String, score : Int, isCurrentUser : Bool)]() 
    
    
    // В userDefaults будут храниться состояния свойста usersArray
    let userDefaults1 = UserDefaults.standard
    
    
    // Метод будет вытаскивать строку из UserDefaults и собирать его в массив usersArray
    func getUsersArrayFromUserDefaultsByString(){
        
        if  let usersArrayAsString = userDefaults1.string(forKey: "keyForUserDefaults") {
                        
            if usersArrayAsString.count != 0 {
                
                var oneUserString : String = ""
                
                for char in usersArrayAsString {
                    if char != ";" {
                        oneUserString += String(char)
                    } else {
 
                        var comma = 0
                        var user = ("", 0, false)
                        var oneUserName = String("")
                        var oneUserScore = String("")
                        var oneUserIsCurrentUser = String("")
                        
                        for char in oneUserString {
  
                            switch comma {

                            case 0 :
                                if char != "," {
                                    oneUserName += String(char)
                                } else {
                                    user.0 = oneUserName
                                    comma += 1
                                    }

                            case 1 :
                                if char != "," {
                                    oneUserScore += String(char)
                                } else {
                                    if let intOneUserScore = Int(oneUserScore){
                                        user.1 = intOneUserScore
                                        
                                    }
                                    
                                    comma += 1
                                    }

                            case 2 :
                                oneUserIsCurrentUser += String(char)
                                //print("!!!!!!!!!!!!!!!!!!!!!!")
                                //print(oneUserIsCurrentUser)
                                if oneUserIsCurrentUser == "true" {user.2 = true}
                                if oneUserIsCurrentUser == "false" {user.2 = false}

                            default:
                                break
                            }
                            oneUserString = ""
                        }
                        usersArray.append(user)
                    }
                }
            } else { return }
        }
    }
    
    // Метод будет принимать массив usersArray, преобразовывать его в строку и созранять в UserDefaults
    func saveUsersArrayToUserDefaultsByStringConvert() {
        userDefaults1.removeObject(forKey: "keyForUserDefaults")
        var usersArrayToString : String = ""
        for user in usersArray {
            usersArrayToString += ((user.name + "," + String(user.score) + "," + String(user.isCurrentUser)) + ";")
        }
        print (" saveUsersArrayToUserDefaultsByStringConvert()")
        print ("пытаемся засунуть usersArrayToString в UserDefault при помощи метода saveUsersArrayToUserDefaultsByStringConvert()")
        print (usersArrayToString)
        userDefaults1.set(usersArrayToString, forKey: "keyForUserDefaults")
    }
    
    // метод возвращает экземпляр класcа User текущего пользователя
    func getCurrentUserFromUsersArray () -> (name : String, score : Int, isCurrentUser : Bool) {
        
        let name : String = ""
        let score : Int = 0
        let isCurrentUser : Bool = false
        var currentUser = ("", 0, false)
        
        for i in 0..<usersArray.count {
            let user = usersArray[i]
            print("\(i) - \(user.name) - \(user.isCurrentUser)")
            if usersArray[i].isCurrentUser == true {
                currentUser.0 = (usersArray[i]).name
                currentUser.1 = usersArray[i].score
                currentUser.2 = usersArray[i].isCurrentUser
                print(name)
                print(score)
                print(String(isCurrentUser))
            }
        }
        //let currentUser = User(name: name , score: score , isCurrentUser: isCurrentUser)
        print("---reterned---")
        print(currentUser.0)
        print(currentUser.1)
        print(currentUser.2)
        print("-------------")
        return currentUser
    }
    
    // метод для проверки есть ли пользователь с именем string : в массиве usersArray нашего класса UsersArray
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
    
    // метод который будет добавлять пользователя в массив usersArray нашего класса UsersArray (или обновлять его если
    // такой пользователь уже есть в массиве)и затем сразу сортировать его
    func addUserToUsersArrayAndSort(user : (name : String, score : Int, isCurrentUser : Bool)) {
        
        var removeUserIndex : Int?
        for i in 0..<usersArray.count {
            if usersArray[i].name == user.name {
                removeUserIndex = i
            }
        }
        if let ind = removeUserIndex {
            usersArray.remove(at: ind)
        }
        
        usersArray.append(user)
        
        // сортировка проводится при помощи метода .sorted и клоужера который является параметром одной из реализаций
        // метода .sorted и указывает на параметр .name в кортеже user по которому и сравниваются эти два пользователя
        let uaSorted = usersArray.sorted { (p1, p2) -> Bool in
            p1.name > p2.name  // поскольку строка в теле клоужера одна слово return можно не писать, возвращается true/false
        }
        usersArray = uaSorted
    }
    
    // назначение или изменение текущего пользователя с дальнейшем сохранением в UserDefaults
    func changeCurrentUser (name : String) {
        // проверка всех элементов массива usersArray и назначение всем пользователям в поле isCurrentUser
        // на значение false
        for i in 0..<usersArray.count {
            usersArray[i].isCurrentUser = false 
        }
        // затем находим пользователя с именем name и в его поле isCurrentUser назначаем true
        for i in 0..<usersArray.count {
            if usersArray[i].name == name {
                usersArray[i].isCurrentUser = true
            }
        }
    }
 
    
}

