//
//  TaskEight.swift
//  Multithreading
//
//  Created by Ксения Шилина on 20.03.2024.
//

import UIKit
//Задание : Написать какая проблема, с помощью Thread Sanitizer найти и описать ее
//(решить с помощью var lock = NSLock())

class TaskEight: UIViewController {
    
    private lazy var name = "I love RM"
    var lock = NSLock()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           updateName()
       }
       
       func updateName() {
           DispatchQueue.global().async {
               self.lock.lock()
               print(self.name) // Считываем имя из global
               print(Thread.current)
               self.lock.unlock()
            
           }
           self.lock.lock()
           print(self.name) // Считываем имя из main
           self.lock.unlock()
       }

}

/*
 Проблема в в том, что идет обрашение к свойству name из разных потоков без какой-либо синхронизации,
что приводит к гонкам данных и возмножно неопределённому поведению  приложения
 
 Ошибка которую выводит Thread Sanitizer - Data race in Multithreading.TaskEight.name.getter : Swift.String at 0x111301000
(указывает на гонку данных при доступе к геттеру свойства name)
*/
