//
//  Task2.swift
//  Multithreading
//
//  Created by Ксения Шилина on 22.03.2024.
//

import UIKit

protocol RMOperationProtocol {
    var priority: DispatchQoS.QoSClass { get }
    var completionBlock: (() -> Void)? { get }
    var isFinished: Bool { get }
    var isExecuting: Bool { get }
    
    
    func start()
}

class RMOperation: RMOperationProtocol {
    var isExecuting: Bool = false

    var priority: DispatchQoS.QoSClass
    var completionBlock: (() -> Void)?
    var isFinished: Bool = false

    init(priority: DispatchQoS.QoSClass, completionBlock: ( () -> Void)? = nil) {
        self.priority = priority
        self.completionBlock = completionBlock
    }

/// В методе start. реализуйте все через глобальную паралельную очередь с приоритетами.
   
    func start() {

        DispatchQueue.global().sync {
            self.completionBlock?()
        }

        DispatchQueue.global().sync {
            self.isFinished = true
        }
    }

}

class ViewController_Task4_Two: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let operationFirst = RMOperation(priority: .default)
        let operationSecond = RMOperation(priority: .default)

        operationFirst.priority = .userInitiated
        operationFirst.completionBlock = {

            for _ in 0..<10 {
                print(2)
            }
            print("First: \(Thread.current)")
            print("Операция полностью завершена!")
        }

        operationFirst.start()



        operationSecond.priority = .background
        operationSecond.completionBlock = {

            for _ in 0..<10 {
                print(1)
            }
            print("Twice: \(Thread.current)")
            print("Операция полностью завершена!")
        }
        operationSecond.start()
    }
}
