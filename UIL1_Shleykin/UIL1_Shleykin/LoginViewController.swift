//
//  LoginViewController.swift
//  UIL1_Shleykin
//
//  Created by Ivan Shleykin on 28/02/2019.
//  Copyright © 2019 Ivan Shleykin. All rights reserved.
//
/*
 Вы будете создавать клиент для социальной сети VKontakte. На этом курсе вам не понадобится аккаунт, так как мы будем заниматься только пользовательским интерфейсом. Все данные будут демонстрационными: вы выведете выдуманные тексты, записанные прямо в коде. Работать с реальными данными мы начнем со следующего курса.
 1) Создать приложение.
 2) Добавить форму для входа.
 3) Адаптировать форму для телефонов в альбомной ориентации, планшетов.
 */
import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var loginTextFiels: UITextField!
    @IBOutlet weak var passTextField: UITextField!

   
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signin(_ sender: Any) {
        if let login = loginTextFiels.text , let pass = passTextField.text {
            if login == "admin" && pass == "qwerty" {
                print("WELCOME")
                
            } else {
                print("DENIED")
            }
        }
     }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
