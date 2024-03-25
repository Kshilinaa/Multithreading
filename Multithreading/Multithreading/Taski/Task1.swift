//
//  Task1.swift
//  Multithreading
//
//  Created by Ксения Шилина on 24.03.2024.
//

import UIKit

class Task1: UIViewController {
        
        override func viewDidLoad() {
                super.viewDidLoad()
            
            print(1)
           // DispatchQueue.main.async {
            Task {
                print(2)
            }
            print(3)
        }
    }

//Объяснить почему так распечаталось (1/3/2)
/*
 сначала у нас печатается 1, потому что print(1) по дефолту стоит на
 main очереди sync и выполняется сразу, далее у нас DispatchQueue.main.async {
 print(2) становится в очередь, тк async ждет, пока не выолнится на sync, поэтому сначала печатется 3, а уже потом возвращется к 2
 */
// Заменить DispatchQueue.main.async на Task - объяснить почему так распечатлось
/*
 замена не изменит результат, тк оба механизма выполняют код асинхронно, не блокируя основной поток выполнения
 */
