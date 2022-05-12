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
    @IBAction func cellPressed(_ sender: UIButton) {

        // создаем переменную типа UsersArray() и изменяем статус текущего пользователя
        let usersArray = UsersArray()
        usersArray.changeCurrentUser(name: nameLabel.text!)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
