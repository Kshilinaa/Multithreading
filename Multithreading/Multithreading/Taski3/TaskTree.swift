//
//  TaskTree.swift
//  Multithreading
//
//  Created by Ксения Шилина on 21.03.2024.
//

import UIKit
//Как называется проблема и решить ее 1 пример
final class TaskTree: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//Проблема - deadlock
        let serialQueue = DispatchQueue(label: "com.example.myQueue")

        serialQueue.async {
           serialQueue.async {
               print("This will never be printed.")
           }
        }

    }
    

}
