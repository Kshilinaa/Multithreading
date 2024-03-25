//
//  Task3.swift
//  Multithreading
//
//  Created by Ксения Шилина on 24.03.2024.
//

import UIKit

class Task3: UIViewController {
   
    override func viewDidLoad() {
               super.viewDidLoad()
           
           print("Task 1 is finished")
          
        Task.detached(priority: .userInitiated) {
               for i in 0..<50 {
                   print(i)
               }
               print("Task 2 is finished")
               print(Thread.current)
           }
           
           print("Task 3 is finished")
       }
   }

    
