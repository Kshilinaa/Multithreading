//
//  Task2.swift
//  Multithreading
//
//  Created by Ксения Шилина on 24.03.2024.
//

import UIKit

class Task2: UIViewController {
        
    override func viewDidLoad() {
               super.viewDidLoad()
           
           print(1)
           Task { @MainActor  in
               print(2)
           }
           print(3)
       }
   }

//Чем этот варинат отличается от прошлого примера, где использовался просто Task?
/*
 Результат не изменится, будет так же выводиться 1/3/2, но так гарантированно выполнение кода будет на главном потоке, в отлчиие от просто Task
 */
