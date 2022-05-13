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
    var taskFromModel = [[""]]
    var secondTaskFromModel =  ((minArgValue: 0, maxArgValue: 0, minAnswerValue: 0, maxAnswerValue: 0, plus: true, minus: true, step: 1))

    var taskMarkers = [false, false, false, false, false, false, false, false]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // далее при загрузке ViewController присваиваем свойству currentUser экземпляр класса User из usersArray
        currentUser = usersArray.getCurrentUserFromUsersArray()

        // выведем полученное имя пользователя и счет в лейбл
        labelVC.text = "Привет " + currentUser.name + ", пока твой счет равен " + String(currentUser.score) + ", выбери задание и начни тренироваться."
        labelVC.layer.masksToBounds = true
        labelVC.layer.cornerRadius = 10

    }
    
    func someFunc(){
        switch taskMarkers {
        case [true, false, false, false, false, false, false, false]:
            //taskFromModel = arrayTask_1_0To5.shuffled()
            secondTaskFromModel = ((minArgValue: 1, maxArgValue: 10, minAnswerValue: 1, maxAnswerValue: 10, plus: true, minus: false, step: 1))
        case [false, true, false, false, false, false, false, false]: taskFromModel = arrayTask_2_5To10.shuffled()
        case [false, false, true, false, false, false, false, false]: taskFromModel = arrayTask_3_0To10.shuffled()
        case [false, false, false, true, false, false, false, false]: taskFromModel = arrayTask_1_0To5.shuffled()
        case [false, false, false, false, true, false, false, false]: taskFromModel = arrayTask_2_5To10.shuffled()
        case [false, false, false, false, false, true, false, false]: taskFromModel = arrayTask_1_0To5.shuffled()
        case [false, false, false, false, false, false, true, false]: taskFromModel = arrayTask_2_5To10.shuffled()
        case [false, false, false, false, false, false, false, true]: taskFromModel = arrayTask_2_5To10.shuffled()
        default: print("Something wrong")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        guard let secondViewController = segue.destination as? SecondViewController else {return}
        secondViewController.newBigTask = taskFromModel
        secondViewController.taskParameters = secondTaskFromModel
        
    }
    
    @IBAction func buttonPress0To5(_ sender: UIButton) {
        taskMarkers[0] = true
        someFunc()
    }
    
    @IBAction func buttonPress5To10(_ sender: UIButton) {
        taskMarkers[1] = true
        someFunc()
    }
    
    @IBAction func buttonPress0To10(_ sender: UIButton) {
        taskMarkers[2] = true
        someFunc()
    }
    
    @IBAction func ButtonPressNext(_ sender: UIButton) {
    }
    
}

