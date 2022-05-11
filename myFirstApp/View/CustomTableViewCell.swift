//
//  CustomTableViewCell.swift
//  myFirstApp
//
//  Created by Александр Мараенко on 18.04.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    // при нажатии на кнопку в ячейке будет совершаться переход на другой ВьюКонтроллер
    // через обычный сегвей установленный через Мейнсториборд
    // но также перед этим мы сохраняем значение имени пользователя их лейбла в ЮзерДефолтс
    // что бы потом после перехода на ВьюКонтроллер извлечь его
    @IBAction func cellPressed(_ sender: UIButton) {
        
        // создаем переменную типа UserDefaults
        let userNameForUserDefaults = UserDefaults.standard
        
        //записываем в нее текстовое значение из лейбла и указываем ключ с
        // помощью которого потом извлечем это значение
        userNameForUserDefaults.set(nameLabel.text, forKey: "currentUserKey")
        
        // создаем переменную типа UsersArray()
        var usersArray = UsersArray()
        
//        // получаем из при помощи метода getUsersArrayFromUserDefaultsByString() из UserDefaults
        // набор пользователей
        usersArray.getUsersArrayFromUserDefaultsByString()
        print("!!!--- был вызыван метод getUsersArrayFromUserDefaultsByString() в рамках класса CustomTableViewCell")
        print("" )
        
        print("" )
        print("--Это печать usersArray CustomTableViewCell" )
        for i in 0..<usersArray.usersArray.count {
            print("\(i) - \((usersArray.usersArray)[i].name) - \((usersArray.usersArray)[i].isCurrentUser)")
        }
        print("--Это конец печати usersArray CustomTableViewCell" )
        print("" )
        
 //       // изменяем состояние usersArray назначая тетущего пользователя меняя статус на true
        usersArray.changeCurrentUser(name: nameLabel.text!)
        print("!!!--- был вызыван метод changeCurrentUser() - в рамках класса CustomTableViewCell")
        print("" )
        print("--Это печать usersArray CustomTableViewCell" )
        for i in 0..<usersArray.usersArray.count {
            print("\(i) - \((usersArray.usersArray)[i].name) - \((usersArray.usersArray)[i].isCurrentUser)")
        }
        print("--Это конец печати usersArray CustomTableViewCell" )
        print("" )
        
 //       // и сохраняем его состояние с измененым
        usersArray.saveUsersArrayToUserDefaultsByStringConvert()
        print("!!!--- был вызыван метод saveUsersArrayToUserDefaultsByStringConvert() в рамках класса CustomTableViewCell")
        print("" )
        
        usersArray = UsersArray()
        usersArray.getUsersArrayFromUserDefaultsByString()
        print("!!!--- был вызыван метод getUsersArrayFromUserDefaultsByString() в рамках класса CustomTableViewCell")

        print("" )
        print("--Это печать usersArray CustomTableViewCell еще раз запрашиваем после сохранения и печатаем" )
        for i in 0..<usersArray.usersArray.count {
            print("\(i) - \((usersArray.usersArray)[i].name) - \((usersArray.usersArray)[i].isCurrentUser)")
        }
        print("--Это конец печати usersArray CustomTableViewCell" )
        print("" )
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
