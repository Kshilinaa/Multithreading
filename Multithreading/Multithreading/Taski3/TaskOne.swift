//
//  TaskOne.swift
//  Multithreading
//
//  Created by Ксения Шилина on 21.03.2024.
//

import UIKit
/* Задание
 Наберите весь код руками. Дан сервис, через который записываем фразы в массив используя цикл. 1) Используя Dispatch@ueue.global() у записывайте фразы через цикл, а не через main thread. 2) Решить проблему потокобезопасности phrases через семафор. 3) Решить проблему,
 используя actor вместо класса.
 */

final class TaskOne: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()

            let phrasesService = PhrasesService()

            for i in 0..<10 {
                DispatchQueue.global().async {
                    Task {
                        await phrasesService.addPhrases("Phrase \(i)")
                    }
                }
            }

            Thread.sleep(forTimeInterval: 1)
            Task {
                print(await phrasesService.phrases)
            }
        }
    }

    actor PhrasesService {
        var phrases: [String] = []

        func addPhrases(_ phrase: String) {
            phrases.append(phrase)
        }
    }

    class ViewController_Task3_One_2: UIViewController {
        let semaphore = DispatchSemaphore(value: 1)
        override func viewDidLoad() {
            super.viewDidLoad()

            let phrasesService = PhrasesService()

            DispatchQueue.global().async {
                for i in 0..<10 {
                    phrasesService.addPhrases("Phrase \(i)")
                }
            }

            Thread.sleep(forTimeInterval: 1)
            self.semaphore.wait()
            print(phrasesService.phrases)
            self.semaphore.signal()
        }

        class PhrasesService {
            var phrases: [String] = []

            func addPhrases(_ phrase: String) {
                phrases.append(phrase)
            }
        }
    }
