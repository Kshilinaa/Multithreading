//
//  Task4.swift
//  Multithreading
//
//  Created by Ксения Шилина on 24.03.2024.
//

import UIKit

class Task4: UIViewController {
//Задание : перевестри этот код на async / await
    override func viewDidLoad() {
            super.viewDidLoad()
        
        async {
                   func randomD6() -> Int {
                       Int.random(in: 1...6)
                   }

                   let result = await randomD6()
                   print(result)
               }
           }
       }
