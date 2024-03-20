//
//  TaskFour.swift
//  Multithreading
//
//  Created by Ксения Шилина on 19.03.2024.
//

import UIKit
//Задание : выставить правильно приоритеты, чтобы сначала печатали 1, потом 2
//Изменить приоритеты, чтобы печатали 2, потом 1
//Поменять приоритеты, чтобы печаталось вперемешку
final class TaskFour: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создаем и запускаем поток
        let thread1 = ThreadprintDemon()
        let thread2 = ThreadprintAngel()
        
        // Меняем приоритеты (1_2)
        thread1.qualityOfService = .default
        thread2.qualityOfService = .background
        
        thread1.start()
        thread2.start()
        
        
        /*    // Меняем приоритеты (2_1)
         thread1.qualityOfService = .utility
         thread2.qualityOfService = .userInitiated
         
         thread1.start()
         thread2.start() */
  /*
         // Меняем приоритеты (вперемешку)
         thread1.qualityOfService = .default
         thread2.qualityOfService = .default
         
         thread1.start()
         thread2.start()
         
         } */
        
        class ThreadprintDemon: Thread {
            override func main() {
                for _ in (0..<100) {
                    print("1")
                }
            }
        }
        class ThreadprintAngel: Thread {
            override func main() {
                for _ in (0..<100) {
                    print("2")
                }
            }
        }
        
    }
}
