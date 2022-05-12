//
//  SecondViewController.swift
//  myFirstApp
//
//  Created by Александр Мараенко on 07.12.2021.
//

import UIKit
import CloudKit

class SecondViewController: UIViewController {
    
    var usersArray = UsersArray()
    var currentUser = (name: "", score: 0, isCurrentUser: false)
    var currentUserTotalScore = 0
    var newBigTask: [[String]]?
    var answer = false
    var currentTask = 0
    let buttonsColorFaultRed = UIColor(red: 0.72, green: 0.00, blue: 0.00, alpha: 0.65)
    let buttonsColorFaultGreen = UIColor(red: 0.00, green: 0.60, blue: 0.44, alpha: 0.81)
    
    var dicForFault : [String : Bool] = ["0" : false,
                                         "1" : false,
                                         "2" : false,
                                         "3" : false,
                                         "4" : false,
                                         "5" : false]
    
    @IBOutlet weak var labelSecondVC: UILabel!
    @IBOutlet weak var buttonBack: UIButton!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var labelTotal: UILabel!
    @IBOutlet weak var labelTotalMain: UILabel!
    
    @IBOutlet weak var button0tapped: UIButton!
    @IBOutlet weak var button1tapped: UIButton!
    @IBOutlet weak var button2tapped: UIButton!
    @IBOutlet weak var button3tapped: UIButton!
    @IBOutlet weak var button4tapped: UIButton!
    @IBOutlet weak var button5tapped: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // обновляем currentUser помещая в него текущего пользователя из usersArray
        currentUser = usersArray.getCurrentUserFromUsersArray()
        
        // обновляем currentUserTotalScore
        currentUserTotalScore = currentUser.score
        
        // помещаем имя пользователя и счет в верхний лейбл
        labelSecondVC.text = "Привет " + currentUser.name + " твой счет равен " + String(currentUserTotalScore) + " Нужно решить 40 примеров"
        labelTotal.text = String(currentUser.score)
        
        labelSecondVC.layer.masksToBounds = true
        labelSecondVC.layer.cornerRadius = 20
        labelTotalMain.layer.masksToBounds = true
        labelTotalMain.layer.cornerRadius = 20
        buttonBack.layer.masksToBounds = true
        buttonBack.layer.cornerRadius = 20
        label1.layer.masksToBounds = true
        label1.layer.cornerRadius = 20
        label2.layer.masksToBounds = true
        label2.layer.cornerRadius = 20
        label3.layer.masksToBounds = true
        label3.layer.cornerRadius = 20
        label4.layer.masksToBounds = true
        label4.layer.cornerRadius = 20
        label5.layer.masksToBounds = true
        label5.layer.cornerRadius = 20
        
        guard let x = newBigTask else {return}
        let a = x[currentTask]
        label1.text = a[0]
        label1.backgroundColor = .systemGray3
        label2.text = a[1]
        label2.backgroundColor = .systemGray3
        label3.text = a[2]
        label3.backgroundColor = .systemGray3
        label4.text = a[3]
        label4.backgroundColor = .systemGray3
        label5.text = "?"
        label5.backgroundColor = .systemGray3
        button0tapped.setTitle(a[5], for: .normal)
        button0tapped.backgroundColor = .systemGray3
        button0tapped.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        
        
        button1tapped.setTitle(a[6], for: .normal)
        button1tapped.backgroundColor = .systemGray3
        
        button2tapped.setTitle(a[7], for: .normal)
        button2tapped.backgroundColor = .systemGray3
        
        button3tapped.setTitle(a[8], for: .normal)
        button3tapped.backgroundColor = .systemGray3
        
        button4tapped.setTitle(a[9], for: .normal)
        button4tapped.backgroundColor = .systemGray3
        
        button5tapped.setTitle(a[10], for: .normal)
        button5tapped.backgroundColor = .systemGray3
        
        button0tapped.layer.cornerRadius = 20
        button1tapped.layer.cornerRadius = 20
        button2tapped.layer.cornerRadius = 20
        button3tapped.layer.cornerRadius = 20
        button4tapped.layer.cornerRadius = 20
        button5tapped.layer.cornerRadius = 20
        
    }
    
    func nextTask() {
        
        dicForFault  = ["0" : false,
                        "1" : false,
                        "2" : false,
                        "3" : false,
                        "4" : false,
                        "5" : false]
        
        guard let x = newBigTask else {return}
        let a = x[currentTask]
        label5.text = a[4]
        
        label5.backgroundColor = buttonsColorFaultGreen
        
        self.currentTask += 1
        guard let x = newBigTask else {return}
        let b = x[currentTask]
        
        Timer.scheduledTimer(withTimeInterval: 1.3 , repeats: false) { (_) in
            self.label1.text = ""
            self.label2.text = ""
            self.label3.text = ""
            self.label4.text = ""
            self.label5.text = ""
            self.label1.isHidden = true
            self.label2.isHidden = true
            self.label3.isHidden = true
            self.label4.isHidden = true
            self.label5.isHidden = true
            self.button0tapped.isHidden = true
            self.button1tapped.isHidden = true
            self.button2tapped.isHidden = true
            self.button3tapped.isHidden = true
            self.button4tapped.isHidden = true
            self.button5tapped.isHidden = true
        }
        
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { [self] (_) in
            self.label1.text = b[0]
            self.label2.text = b[1]
            self.label3.text = b[2]
            self.label4.text = b[3]
            self.label5.text = "?"
            self.label5.backgroundColor = .systemGray3
            self.label1.isHidden = false
            self.label2.isHidden = false
            self.label3.isHidden = false
            self.label4.isHidden = false
            self.label5.isHidden = false
            self.button0tapped.setTitle(b[5], for: .normal)
            self.button1tapped.setTitle(b[6], for: .normal)
            self.button2tapped.setTitle(b[7], for: .normal)
            self.button3tapped.setTitle(b[8], for: .normal)
            self.button4tapped.setTitle(b[9], for: .normal)
            self.button5tapped.setTitle(b[10], for: .normal)
            self.button0tapped.isHidden = false
            self.button1tapped.isHidden = false
            self.button2tapped.isHidden = false
            self.button3tapped.isHidden = false
            self.button4tapped.isHidden = false
            self.button5tapped.isHidden = false
            self.labelTotal.text = String(currentUserTotalScore)
            if self.currentTask >= x.count {
                self.currentTask = 0
                self.labelSecondVC.layer.masksToBounds = true
                self.labelSecondVC.layer.cornerRadius = 20
                self.labelSecondVC.text = "Ай Молодец !!!"
            }
        }
        
        
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { (_) in
            self.button0tapped.backgroundColor = .systemGray3
            self.button1tapped.backgroundColor = .systemGray3
            self.button2tapped.backgroundColor = .systemGray3
            self.button3tapped.backgroundColor = .systemGray3
            self.button4tapped.backgroundColor = .systemGray3
            self.button5tapped.backgroundColor = .systemGray3
        }
        
    }
    
    func checkAnswer(for value: String, currentTask: Int) -> Bool {
        guard let x = newBigTask else { return false}
        let v = x[currentTask]
        
        if value == v[4]{
            return true
        } else {
            return false
        }
    }
    
    //    func successTask()  {
    //      Еще один способ сдалвать задержку через выполнение кода в отдельнем потоке
    //      let seconds = 3.0
    //        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
    //            self.button1tapped.backgroundColor = .systemGray3
    //            self.button2tapped.backgroundColor = .systemGray3
    //            self.button3tapped.backgroundColor = .systemGray3
    //            self.button4tapped.backgroundColor = .systemGray3
    //            self.button5tapped.backgroundColor = .systemGray3
    //        }
    //     }

    func currentUserTotalUpdate(result: Bool){
        if result {
            currentUserTotalScore += 1
            labelTotal.text = String(currentUserTotalScore)
            // помещаем имя пользователя и счет в верхний лейбл
            labelSecondVC.text = "Привет " + currentUser.name + " твой счет равен " + String(currentUserTotalScore) + " Нужно решить 40 примеров"
            labelTotal.text = String(currentUserTotalScore)
        } else {
            if currentUserTotalScore > 0 {
                currentUserTotalScore -= 1
                labelTotal.text = String(currentUserTotalScore)
                // помещаем имя пользователя и счет в верхний лейбл
                labelSecondVC.text = "Привет " + currentUser.name + " твой счет равен " + String(currentUserTotalScore) + " Нужно решить 40 примеров"
                labelTotal.text = String(currentUserTotalScore)
            }
        }
    }
    
    // при нажатии кнопки Назад кроме перехода на предыдущий экран сохраняем игровой
    // счет currentUserTotalScore в usersArray, далее при соритровке методом
    // addUserToUsersArrayAndSort при обращении к usersArray состояние массива сохранится
    // при помощи механизма встроенного а гетер
    @IBAction func buttonBack(_ sender: UIButton) {
        currentUser.score = currentUserTotalScore
        usersArray.addUserToUsersArrayAndSort(user : currentUser )
    }
    
    @IBAction func buttonPress_0(_ sender: UIButton) {
        guard let x = newBigTask else {return}
        let a = x[currentTask]
        answer = checkAnswer(for: a[5], currentTask: currentTask)
        if answer == false{
            button0tapped.backgroundColor = buttonsColorFaultRed
            if dicForFault[a[5]] == false {
                currentUserTotalUpdate(result: answer)
                dicForFault[a[5]] = true
            }
        } else {
            currentUserTotalUpdate(result: answer)
            button0tapped.backgroundColor = buttonsColorFaultGreen
            nextTask()
        }
    }
    
    @IBAction func buttonPress_1(_ sender: UIButton) {
        guard let x = newBigTask else {return}
        let a = x[currentTask]
        answer = checkAnswer(for: a[6], currentTask: currentTask)
        if answer == false{
            button1tapped.backgroundColor = buttonsColorFaultRed
            if dicForFault[a[6]] == false {
                currentUserTotalUpdate(result: answer)
                dicForFault[a[6]] = true
            }
        } else {
            currentUserTotalUpdate(result: answer)
            button1tapped.backgroundColor = buttonsColorFaultGreen
            nextTask()
        }
    }
    
    @IBAction func buttonPress_2(_ sender: UIButton) {
        guard let x = newBigTask else {return}
        let a = x[currentTask]
        answer = checkAnswer(for: a[7], currentTask: currentTask)
        if answer == false{
            button2tapped.backgroundColor = buttonsColorFaultRed
            if dicForFault[a[7]] == false {
                currentUserTotalUpdate(result: answer)
                dicForFault[a[7]] = true
            }
        } else {
            currentUserTotalUpdate(result: answer)
            button2tapped.backgroundColor = buttonsColorFaultGreen
            nextTask()
        }
    }
    
    @IBAction func buttonPress_3(_ sender: UIButton) {
        guard let x = newBigTask else {return}
        let a = x[currentTask]
        answer = checkAnswer(for: a[8], currentTask: currentTask)
        if answer == false{
            button3tapped.backgroundColor = buttonsColorFaultRed
            if dicForFault[a[8]] == false {
                currentUserTotalUpdate(result: answer)
                dicForFault[a[8]] = true
            }
        } else {
            currentUserTotalUpdate(result: answer)
            button3tapped.backgroundColor = buttonsColorFaultGreen
            nextTask()
        }
    }
    
    @IBAction func buttonPress_4(_ sender: UIButton) {
        guard let x = newBigTask else {return}
        let a = x[currentTask]
        answer = checkAnswer(for: a[9], currentTask: currentTask)
        if answer == false{
            button4tapped.backgroundColor = buttonsColorFaultRed
            if dicForFault[a[9]] == false {
                currentUserTotalUpdate(result: answer)
                dicForFault[a[9]] = true
            }
        } else {
            currentUserTotalUpdate(result: answer)
            button4tapped.backgroundColor = buttonsColorFaultGreen
            nextTask()
        }
    }
    
    @IBAction func buttonPress_5(_ sender: UIButton) {
        guard let x = newBigTask else {return}
        let a = x[currentTask]
        answer = checkAnswer(for: a[10], currentTask: currentTask)
        if answer == false{
            button5tapped.backgroundColor = buttonsColorFaultRed
            if dicForFault[a[10]] == false {
                currentUserTotalUpdate(result: answer)
                dicForFault[a[10]] = true
            }
        } else {
            currentUserTotalUpdate(result: answer)
            button5tapped.backgroundColor = buttonsColorFaultGreen
            nextTask()
        }
    }
}
