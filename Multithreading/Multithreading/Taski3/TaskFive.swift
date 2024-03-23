//
//  TaskFive.swift
//  Multithreading
//
//  Created by Ксения Шилина on 21.03.2024.
//

import UIKit
//Как называется проблема и решить ее
//Пример 3
class TaskFive: UIViewController {
//Проблема - livelock
    override func viewDidLoad() {
            super.viewDidLoad()

            let people1 = People1()
            let people2 = People2()

            let thread1 = Thread {
                people1.walkPast(with: people2)
            }

            thread1.start()

            let thread2 = Thread { 
                people2.walkPast(with: people1)
            }

            thread2.start()
        }
    }

    class People1 {
        var isDifferentDirections = false
        let semaphore = DispatchSemaphore(value: 1)
        func walkPast(with people: People2) {

            DispatchQueue.global(qos: .background).async {
                while (!people.isDifferentDirections) {
                    print(Thread.current)
                    print("People1 не может обойти People2")
                    sleep(1)
                }
            }

            DispatchQueue.global(qos: .userInteractive).async {
                self.semaphore.wait()
                print("People1 смог пройти прямо")
                self.isDifferentDirections = true
                self.semaphore.signal()
            }
        }
    }

    class People2 {
        var isDifferentDirections = false
        let semaphore = DispatchSemaphore(value: 1)
        func walkPast(with people: People1) {

            DispatchQueue.global(qos: .background).async {
                while (!people.isDifferentDirections) {
                    print(Thread.current)
                    print("People2 не может обойти People1")
                    sleep(1)
                }
            }

            DispatchQueue.global(qos: .userInitiated).async {
                self.semaphore.wait()
                print("People2 смог пройти прямо")
                self.isDifferentDirections = true
                self.semaphore.signal()
            }
        }
    }
