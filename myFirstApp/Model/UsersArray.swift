//
//  NewModelArray.swift
//  myFirstApp
//
//  Created by Александр Мараенко on 31.03.2022.
//

import Foundation

class UsersArray {
    
    // В userDefaults будут храниться состояния свойста usersArray
    let userDefaults = UserDefaults.standard
    
    // это основное свойство класса, в нем будет храниться массив всех пользователей, пользователь описан в виде кортежа
    var newUsersArray : [(name : String, score : Int, isCurrentUser : Bool)] {
        
        // задаем геттер, он будет возвращать экземпляр массива пользователей вычисляемый из
        // свойства userDefaults. В userDefaults он хранится в виде строки, поэтому здесь
        // реализован механизм конвертации из массива в строку
        get {
            var someUsersArray = [(name : String, score : Int, isCurrentUser : Bool)]()
            if  let usersArrayAsString = userDefaults.string(forKey: "keyForUserDefaults") {
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
                                    if oneUserIsCurrentUser == "true" {user.2 = true}
                                    if oneUserIsCurrentUser == "false" {user.2 = false}
                                default:
                                    break
                                }
                                oneUserString = ""
                            }
                            someUsersArray.append(user)
                        }
                    }
                } else { return someUsersArray }
            }
            return someUsersArray
        }
        
        // сетер при каждом изменеии массива сохранет его в userDefaults в виде строки
        set {
            userDefaults.removeObject(forKey: "keyForUserDefaults")
            var usersArrayToString : String = ""
            for user in newValue {
                usersArrayToString += ((user.name + "," + String(user.score) + "," + String(user.isCurrentUser)) + ";")
            }
            print (usersArrayToString)
            userDefaults.set(usersArrayToString, forKey: "keyForUserDefaults")
        }
    }
    
    // метод возвращает экземпляр класcа User текущего пользователя в виде кортежа из массива пользователей newUsersArray
    func getCurrentUserFromUsersArray () -> (name : String, score : Int, isCurrentUser : Bool) {
        var currentUser : (String, Int, Bool) = ("", 0, false)
        for i in 0..<newUsersArray.count {
            if newUsersArray[i].isCurrentUser == true {
                currentUser.0 = (newUsersArray[i]).name
                currentUser.1 = newUsersArray[i].score
                currentUser.2 = newUsersArray[i].isCurrentUser
            }
        }
        return currentUser
    }
    
    // метод для проверки есть ли пользователь с именем string : в массиве usersArray нашего класса UsersArray
    func isItemInArrayInClassUsersArray(string : String) -> Bool{
        var usersCount = 0
        for item in newUsersArray {
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
        for i in 0..<newUsersArray.count {
            if newUsersArray[i].name == user.name {
                removeUserIndex = i
            }
        }
        if let ind = removeUserIndex {
            newUsersArray.remove(at: ind)
        }
        newUsersArray.append(user)
        
        // сортировка проводится при помощи метода .sorted и клоужера который является параметром одной из реализаций
        // метода .sorted и указывает на параметр .name в кортеже user по которому и сравниваются эти два пользователя
        let uaSorted = newUsersArray.sorted { (p1, p2) -> Bool in
            p1.name > p2.name  // поскольку строка в теле клоужера одна слово return можно не писать, возвращается true/false
        }
        newUsersArray = uaSorted
    }
    
    // назначение или изменение текущего пользователя с дальнейшем сохранением в UserDefaults
    func changeCurrentUser (name : String) {
        // проверка всех элементов массива usersArray и назначение всем пользователям в поле
        // isCurrentUser на значение false
        for i in 0..<newUsersArray.count {
            newUsersArray[i].isCurrentUser = false
        }
        // затем находим пользователя с именем name и в его поле isCurrentUser назначаем true
        for i in 0..<newUsersArray.count {
            if newUsersArray[i].name == name {
                newUsersArray[i].isCurrentUser = true
            }
        }
    }
}

