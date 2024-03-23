//
//  Task4.swift
//  Multithreading
//
//  Created by Ксения Шилина on 22.03.2024.
//

import UIKit
//Задание : Находим проблему, пишем как называется такая проблема. Фиксим сначала одним способом который вы уже знаете потом вторым на ваше усмотрение.

// Проблема - Гонка данных(race condition)

final class RMOperationQueue1: RMOperationQueueProtocol {
    private let queue = DispatchQueue(label: "com.example.RMOperationQueue", attributes: .concurrent)
    var operations: [RMOperation] = []
    
    func addOperation(_ operation: RMOperation) {
        queue.async(flags: .barrier) { [weak self] in
            self?.operations.append(operation)
            self?.executeNextOperation()
        }
    }
    
    func executeNextOperation() {
        queue.async(flags: .barrier) { [weak self] in
            if let nextOperation = self?.operations.first(where: { !$0.isExecuting && !$0.isFinished }) {
                nextOperation.start()
                self?.executeNextOperation()
            }
        }
    }
    
}

/* Второй вариант решения через мютекс
 final class RMOperationQueue: RMOperationQueueProtocol {
     private let lock = NSLock()
     var operations: [RMOperation] = []

     func addOperation(_ operation: RMOperation) {
         lock.lock()
         operations.append(operation)
         lock.unlock()
         executeNextOperation()
     }

     func executeNextOperation() {
         lock.lock()
         defer {
             lock.unlock()
         }
         
         if let nextOperation = operations.first(where: { !$0.isExecuting && !$0.isFinished }) {
             nextOperation.start()
             executeNextOperation()
         }
     }
 }

 */
