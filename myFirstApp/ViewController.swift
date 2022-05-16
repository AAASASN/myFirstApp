//
//  ViewController.swift
//  myFirstApp
//
//  Created by Александр Мараенко on 04.12.2021.
//


import UIKit 

class ViewController: UIViewController { // 2

    @IBOutlet weak var labelVC: UILabel!
    
    var valueReceivedFromAddUserNameViewController = UsersArray()
    var usersArray = UsersArray()
    var currentUser = (name: "", score: 0, isCurrentUser: false)
    var taskConfig =  ((minArgValue: 0, maxArgValue: 0, minAnswerValue: 0, maxAnswerValue: 0, plus: true, minus: true, step: 1))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // далее при загрузке ViewController присваиваем свойству currentUser экземпляр класса User из usersArray
        currentUser = usersArray.getCurrentUserFromUsersArray()

        // выведем полученное имя пользователя и счет в лейбл
        labelVC.text = "Привет " + currentUser.name + ", пока твой счет равен " + String(currentUser.score) + ", выбери задание и начни тренироваться."
        labelVC.layer.masksToBounds = true
        labelVC.layer.cornerRadius = 10
    }
    
    // этот сегвей передает на SecondViewController контеж taskConfig с настройками таска
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        guard let secondViewController = segue.destination as? SecondViewController else {return}
        secondViewController.taskParameters = taskConfig
    }
    
    // при нажатии на кнопку в taskConfig присваивается значения кортежа с настройками таска
    @IBAction func buttonPressedTask0(_ sender: UIButton) {
        taskConfig = ((minArgValue: 0, maxArgValue: 5, minAnswerValue: 0, maxAnswerValue: 5, plus: true, minus: true, step: 1))
    }
    
    @IBAction func buttonPressedTask1(_ sender: UIButton) {
        taskConfig = ((minArgValue: 5, maxArgValue: 10, minAnswerValue: 5, maxAnswerValue: 10, plus: true, minus: true, step: 1))
    }
    
    @IBAction func buttonPressedTask2(_ sender: UIButton) {
        taskConfig = ((minArgValue: 0, maxArgValue: 10, minAnswerValue: 0, maxAnswerValue: 10, plus: true, minus: true, step: 1))
    }
    
    @IBAction func buttonPressedTask3(_ sender: UIButton) {
        taskConfig = ((minArgValue: 10, maxArgValue: 15, minAnswerValue: 10, maxAnswerValue: 15, plus: true, minus: true, step: 1))
    }
    
    @IBAction func buttonPressedTask4(_ sender: UIButton) {
        taskConfig = ((minArgValue: 10, maxArgValue: 20, minAnswerValue: 10, maxAnswerValue: 20, plus: true, minus: true, step: 1))
    }
    
    @IBAction func buttonPressedTask5(_ sender: UIButton) {
        taskConfig = ((minArgValue: 0, maxArgValue: 20, minAnswerValue: 0, maxAnswerValue: 20, plus: true, minus: true, step: 1))
    }
    
    
    @IBAction func buttonPressedTask6(_ sender: UIButton) {
        taskConfig = ((minArgValue: 0, maxArgValue: 100, minAnswerValue: 0, maxAnswerValue: 100, plus: true, minus: true, step: 1))
    }
    
    @IBAction func ButtonPressNext(_ sender: UIButton) {
    }
    
}
