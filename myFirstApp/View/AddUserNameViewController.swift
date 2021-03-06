//
//  AddUserNameViewController.swift
//  myFirstApp
//
//  Created by Александр Мараенко on 31.03.2022.
//

import UIKit

class AddUserNameViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var usersArray = UsersArray()
    var currentNameInAddUserNameViewController: String?
    @IBOutlet weak var textFieldForUserName: UITextField!       // создаем IBOutlet для текстого поля для ввода имни нового пользователя
    @IBOutlet weak var nameSaveButtonOutlet: UIButton!          // создаем IBOutlet для кнопки
    @IBOutlet weak var startGameAfterUserSaving: UIButton!
    @IBOutlet weak var backAfterUserSaving: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var upLabel: UILabel!
    
    @objc override func viewDidLoad() {
        super.viewDidLoad()
  
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        initialSetup()  // вызовем метод для отслеживания уведомления о появлении клавиатуры
        
        if usersArray.newUsersArray.count == 0 {
            upLabel.text = "Создайте нового пользователя"
        } else {
            upLabel.text = "Выберите пользователя"
        }
    }
    
    override func viewWillAppear (_ animated: Bool) {
        tableView.reloadData()
    }
    
    // удаляем функцию наблюдателя при уходе с нашего контроллера
    deinit {
        removeInitialSetup()
    }
    
    // создаем функцию-наблюдатель которая будет срабатывать при появлении и пропадании клавиатуры
    // и внутри себя вызывать методы которые будут изменять размер View
    func initialSetup() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))) // для скрытия клавиатуры
        // подключаем "наблюдателей" которые будут отслкживать появление клавиатуры и вызывать методы keyboardWillShow и keyboardWillHide
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // этот метод будет удалять "наблюдателей" из нашего контроллера, он будет вызываться при выходе из нашего контроллера и его деинициализации
    func removeInitialSetup(){
        // отключаем "наблюдателей"
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // keyboardWillShow будет высчитывать значение сдвига view из полученого значения высоты клвиатуры
    @objc func keyboardWillShow (notification: NSNotification){
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            let bottomSpace = self.view.frame.height - (nameSaveButtonOutlet.frame.origin.y + nameSaveButtonOutlet.frame.height)
            self.view.frame.origin.y += (keyboardHeight - bottomSpace) - 50
        }
    }
    
    // возвращает размер view в исходное значение после пропадания клавиатуры
    @objc func keyboardWillHide (){
        self.view.frame.origin.y = 0
    }
    
    //view.endEditing(true) позволяет скрыть клавиатуру при нажатии на любое другое поле
    @objc func hideKeyboard(){
        self.view.endEditing(true)
    }
    
    // создаем IBAction для кнопки которая будет сохранять текст введенный в
    // textFieldForUserName в глобальный массив пользователей usersArray
    @IBAction func nameSaveButton(_ sender: Any) {
        
        // один из двух способов скрыть клавиатуру
        // hideKeyboard()
        textFieldForUserName.resignFirstResponder()
        
        // проверяем есть ли уже пользователь с таким именем
        // выполняем проверку вводимого имени, она не должно быть пустым, == ""
        if textFieldForUserName.text! == "" {
            // создадим UIAlertController
            let alertController = UIAlertController(title: "Внимание", message: "Имя пользователя не может быть пустым.", preferredStyle: .alert)
            
            // создадим UIAlertAction - он будет создавать кнопку, на ней мы можем задать название для нее
            // и инициировать события после нажатия на кнопку при этом можно передать замыкание, которое
            // будет выполнено при нажатии на эту кнопку в нашем случае после нажатия на кнопку OK ничего
            // происходить не будет, просто будет скрыто сообщение alertController
            let okAction = UIAlertAction(title: "OK", style: .default)
//                { (action) -> Void in
//                    // какой-то код замыкания //
//                }
            
            alertController.addAction(okAction) // добавляем UIAlertAction в UIAlertController
            self.present(alertController, animated: true, completion: nil) // вызываем  UIAlertController
            
        } else { // иначе если имя пользователя не равно == ""
            if usersArray.isItemInArrayInClassUsersArray(string: textFieldForUserName.text!) {
                // если пользователь с именем введенным в textFieldForUserName уже существует в usersArray отработает alertController сообщив
                // об этом создадим UIAlertController
                let alertController = UIAlertController(title: "Внимание", message: "Пользователь с таким именем уже существует. Введите другое имя.", preferredStyle: .alert)
                // создадим UIAlertAction - он будет инициировать события после нажатия на кнопку
                // в нашем случае после нажатия на кнопку OK ничего происходить не будет, просто
                // будет скрыто сообщение alertController
                let okAction = UIAlertAction(title: "OK", style: .default)
//                { (action) -> Void in
//                    // какой-то код замыкания //
//                }
                
                alertController.addAction(okAction) // добавляем UIAlertAction в UIAlertController
                self.present(alertController, animated: true, completion: nil) // вызываем  UIAlertController
            } else {
                
                // если поле не пустое добавляем пользователя в массив при помощи метода addUserToUsersArrayAndSort
                usersArray.addUserToUsersArrayAndSort(user: (name: textFieldForUserName.text!, score: 0, isCurrentUser: false))
                
                // сразу после добавления пользователя в массив обновляем tableView
                tableView.reloadData()
                
                }
            
            // очищаем текстовое поле перед началом очередного ввода
            textFieldForUserName.text! = ""
            upLabel.text = "Выберите пользователя"
            
        }
    }
    
    
    //  *** Логика работы таблицы ***
    // этот обязательный метод возвращает нам количество строк в секции таблицы
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.newUsersArray.count
    }
    
    // этот обязательный метод возвращает ячейку таблицы вместе с содержимым, и вызывается он столько раз сколько у нас
    // ячеек в таблице, каждый раз когда он будет вызываться он будет брать UITableViewCell для соответствующего элемента по индексу IndexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // тут мы создаем ячейку которую будем возвращать каждый раз, ей мы присваиваем то что возвращает
        // метод dequeueReusableCell из tableView , указывая индекс "Cell1" из сториборда
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell1", for: indexPath) as! CustomTableViewCell
                
        // создаем переменную и помещаем в нее один экземпляр массива по номеру indexPath.row
        let model = usersArray.newUsersArray[indexPath.row]
        cell.nameLabel.text = model.name
        cell.scoreLabel.text = String(model.score)
        // также в ячейку можно вывести картинку через свойство .image
        // cell.imageView?.image = UIImage(named: "XXXXXXX")
        return cell
    }
    
    // этот метод - один из вариантов реализации удаления ячейки свапом влево, возвращает переменную типа UISwipeActionsConfiguration
    // в котом реализованна позможность задать текст
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?{
        
        let deleteAction = UIContextualAction(style: .normal, title:  "Удалить профиль", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in success(true)
            
            // remove the item from the data model
            self.usersArray.newUsersArray.remove(at: indexPath.row)

            // delete the table view row
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        })
        deleteAction.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    // Возвращает действия смахивания вправо для отображения на левом крае строки.
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title:  "Изменить имя пользователя", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in success(true)
            // код по внесению изменений
            // создание Alert Controller
            let alertController = UIAlertController(title: "Изменить имя пользователя", message: "Введите новое имя", preferredStyle: .alert)
            // добавляем первое текстовое поле в Alert Controller
            alertController.addTextField { textField in
                textField.placeholder = "новое имя" }
            
            // кнопка изменения контакта
            let changeUserNameButton = UIAlertAction(title: "Изменить", style: .cancel
            ) { [self]_ in
                
                guard let newUserName = alertController.textFields?[0].text else {
                    return
                }
    
                // проверяем не пытаемся ли мы сохранить пустое имя, если да то появляется уведомление что это невозможно
                if alertController.textFields?[0].text == "" {
                    // создадим UIAlertController
                    let alertController = UIAlertController(title: "Внимание!", message: "Имя не может быть пустым.", preferredStyle: .alert)
                    // создадим UIAlertAction - он будет инициировать события после нажатия на кнопку
                    let okAction = UIAlertAction(title: "OK", style: .default) { (action) -> Void in
                        // здесь бы мог быть какой-то код выполняемый после нажатия на кнопку OK, но его нет
                    }
                    alertController.addAction(okAction) // добавляем UIAlertAction в UIAlertController
                    self.present(alertController, animated: true, completion: nil) // вызываем  UIAlertController
                } else {
                    // если поле не пустое то вносим изменения в имя пользователя и обновляем таблицу
                    var user = usersArray.newUsersArray.remove(at: indexPath.row)
                    user.name = newUserName
                    usersArray.newUsersArray.append(user)
                    self.tableView.reloadData()
                }
            }
            // кнопка отмены
            let cancelButton = UIAlertAction(title: "Отменить", style: .default, handler: nil)
            
            // добавляем кнопку в Alert Controller
            alertController.addAction(changeUserNameButton)
            alertController.addAction(cancelButton)
            // отображаем Alert Controller
            self.present(alertController, animated: true, completion: nil)
        })
        editAction.backgroundColor = .blue
        return UISwipeActionsConfiguration(actions: [editAction])
    }
}


