//
//  ViewController.swift
//  myFirstApp
//
//  Created by Александр Мараенко on 04.12.2021.
//

///////////////////////////////////
//////
import UIKit 

class ViewController: UIViewController { // 2

    var valueReceivedFromAddUserNameViewController = UsersArray()
    var usersArray = UsersArray()
    var currentUser = User(name: "www", score: "www")
    
    
    @IBOutlet weak var labelVC: UILabel!
    
    var taskFromModel = [[""]]
    var taskMarkers = [false, false, false, false, false]
    
    override func viewDidLoad() {
        
        // загрузив текущий контроллер вытасткиваем из ЮзерДефолтс имя пользователя
        // сохраненного на предыдущем контроллере
        let currentUserNameDefaults = UserDefaults.standard
        let currentUserName = currentUserNameDefaults.object(forKey: "currentUserKey") as! String
        
        // затем также вытаскиваем счет этого пользователя из другого UserDefaults по сути
        // ключем будет имя currentUserName вытащеное из UserDefaults в предыдущей конструкции плюс слово "key"
        let currentUserScoreDefaults = UserDefaults.standard
        let currentUserScore = currentUserScoreDefaults.object(forKey: currentUserName + "key") as! String
        
        
        // выведем полученное имя пользователя и счет в лейбл
        labelVC.text = "Привет " + currentUserName + ", пока твой счет равен " + currentUserScore + ", выбери задание и начни тренироваться."

        print(currentUserName)

        
        super.viewDidLoad()
        labelVC.layer.masksToBounds = true
        labelVC.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
        //some comment
    }
    
    
    func someFunc(){
        switch taskMarkers {
        case [true, false, false, false, false]: taskFromModel = arrayTask_1_0To5.shuffled()
        case [false, true, false, false, false]: taskFromModel = arrayTask_2_5To10.shuffled()
        case [false, false, true, false, false]: taskFromModel = arrayTask_3_0To10.shuffled()
        default: print("Something wrong")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        guard let secondViewController = segue.destination as? SecondViewController else {return}
        secondViewController.newBigTask = taskFromModel

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

