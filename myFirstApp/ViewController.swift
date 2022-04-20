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
        
        print(currentUser.name)
        print(currentUser.score)
        
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

