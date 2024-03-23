//
//  TaskFour.swift
//  Multithreading
//
//  Created by Ксения Шилина on 21.03.2024.
//

import UIKit
//Как называется проблема и решить ее
//Пример 2
class TaskFour: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
 //Проблема - Race Condition
        var sharedResource = 0
        let lock = NSLock()
        
        DispatchQueue.global(qos: .background).async {
            for _ in 1...100 {
                lock.lock()
                sharedResource += 1
                lock.unlock()
            }
        }
        
        DispatchQueue.global(qos: .background).async {
            for _ in 1...100 {
                lock.lock()
                sharedResource += 1
                lock.unlock()
            }
        }
    }
}
