//
//  TaskFive.swift
//  Multithreading
//
//  Created by Ксения Шилина on 19.03.2024.
//

import UIKit
/*
 Объяснить почему вывелся именно такое порядок в консоле
 Теперь DispatchQueue.global.async изменить азупс на sync и объяснить почему консоль отображается именно так
 Bерните на sync и с помощью инструмента Thread Sanitizer найдите проблему этого кода и решите ее с помощью private let lockQueue-DispatchQueue(label: "name.lock.queue").
 */

class TaskFive: UIViewController {
  
    private var name = "Введите имя"
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           updateName()
       }
       
    private let lockQueue = DispatchQueue(label: "name.lock.queue")
    
       func updateName() {
           lockQueue.async {
               self.name = "I love RM"
               print(Thread.current)
               print(self.name)
           }
           lockQueue.async {
               print("На главном потоке - \(self.name)")
           }
       }
       
    }
    
/* Почему вывелся такой результат в консоли (при DispatchQueue.global().async) - результат непредсказуем, из-за ансинхронности
 
 Почему вывелся такой результат в консоли (при DispatchQueue.global().sync) - потому что поток, который вызывает updateName(), будет заблокирован до тех пор, пока блок, переданный в sync, не будет выполнен
*/
