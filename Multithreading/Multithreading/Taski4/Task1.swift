//
//  Task1.swift
//  Multithreading
//
//  Created by Ксения Шилина on 22.03.2024.
//

import UIKit

class Task1: UIViewController {
    
    class Post: @unchecked Sendable {}
    
    enum Statel: Sendable {
        case loading
        case data(String)
    }
    enum State2: Sendable {
        case loading
        case data(Post)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
    

