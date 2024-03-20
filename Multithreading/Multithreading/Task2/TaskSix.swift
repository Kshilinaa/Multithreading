//
//  TaskSix.swift
//  Multithreading
//
//  Created by Ксения Шилина on 19.03.2024.
//

import UIKit
//Задание : написать что выведется в консоль и объяснить почему так
class TaskSix: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("A")
        
        DispatchQueue.main.async {
            print("B")
        }
        
        print("C")
    }
}
//Выведется А С В - потому, что код внутри DispatchQueue.main.async будет выполнен асинхронно после завершения текущего потока
