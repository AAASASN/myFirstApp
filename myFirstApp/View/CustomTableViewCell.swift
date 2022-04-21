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
        
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
