//
//  MainThread.swift
//  Multithreading
//
//  Created by Ксения Шилина on 18.03.2024.
//

import UIKit

final class TaskOne : UIViewController {
    /// Только первый цикл перевести в другой поток с помощью Thread.detachNewThread и обяснить почему изменился вывод.
    //Изначально выводилось все в один поток, а используя Thread.detachNewThread выводится будет в 2 разных потока
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in (0..<10) {
            let currentThread = Thread.detachNewThread
            print("1, Current thread: \(currentThread)")
        }
        
        for _ in (0..<10) {
            let currentThread = Thread.current
            print("2, Current thread: \(currentThread)")
        }
    }
}
