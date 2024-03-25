//
//  Task6.swift
//  Multithreading
//
//  Created by Ксения Шилина on 24.03.2024.
//

import UIKit

    //А теперь этот же метод обработать через withChecked
    //    ThrowingContinuation на случай если messages.isEmpty
    //TO continuation.resume(throwing: a если не пустой то resume(returning:.
    enum MessageError: Error {
        case empty
        case failedToLoad
    }
    
final class Task6: UIViewController {
        
    var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            do {
                print(try await fetchMessages())
            } catch {
                print(error)
            }
        }
    }
    
    func fetchMessages() async throws -> [Message] {
        try await withCheckedThrowingContinuation { continutaion in
            networkService.fetchMessages { messages in
                if messages.isEmpty {
                    continutaion.resume(throwing: MessageError.empty)
                } else {
                    continutaion.resume(returning: messages)
                }
            }
        }
    }
}

