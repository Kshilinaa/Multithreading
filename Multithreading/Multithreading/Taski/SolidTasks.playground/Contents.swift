import UIKit

//Задача из блока Single Responsibility Principle

class NetworkManager {
    func fetchData(url: URL) {
        // Запрос к API
    }
}
class View {
    func updateUI() {
        // обновляет пользовательский интерфейс
    }
}

//Задача 1 из блока Open-Clouse

protocol Sound {
    func makeSound(animalVoice: String)
}

class Animal: Sound {
    let name: String

    init(name: String) {
        self.name = name
    }

    func makeSound(animalVoice: String) {
        print(animalVoice)
    }
}

let tiger = Animal(name: "Tiger")
tiger.makeSound(animalVoice: "Rrrr")

//Задача 2 из блока Open-Clouse

protocol Size {
    func countSize() -> CGSize
}

struct Circle: Size {
  let radius: CGFloat
    
    func countSize() -> CGSize {
        let diameter = radius * 2
       return CGSize(width: diameter, height: diameter)
    }
    
    
}

struct Rectangle: Size {
    
   let width: CGFloat
   let height: CGFloat
    
    func countSize() -> CGSize {
        return CGSize(width: width, height: height)
    }
    

}

class SizePrinter {
    
    func printSize(of figure: Size) {
        print(figure.countSize())
        
    }
}



//Задача из блока Liskov Substitution Principle, LSP

protocol FlyingBirdsProtocol {
    func fly()
}

class Bird {
    func sing (){
    }
}

class Swift: Bird, FlyingBirdsProtocol {
    func fly() {
    }
}

class Penguin: Bird {

    }

let myBird: Bird = Penguin()
myBird.sing()  // Приведет к ошибке во время выполнения

//Задача из блока Interface Segregation Principle

protocol Worker {
    func work()
}

protocol Eating {
    func eat()
}

class Robot: Worker {
    func work() {
    }
}


//Задача из блока Dependency Inversion Principle

protocol SwitchStatus {
    func turnOn()
    func turnOff()
}


class LightBulb: SwitchStatus {
    func turnOn() {
    }

    func turnOff() {
    }
}

class LedBulb: SwitchStatus {
    func turnOn() {
    }

    func turnOff() {
    }
}

class Switch {
    let bulb: SwitchStatus

    init(bulb: SwitchStatus) {
        self.bulb = bulb
    }

    func toggle() {
        bulb.turnOn()
    }
}
let lightBulb = LightBulb()
let ledBulb = LedBulb()

let mySwitch = Switch(bulb: lightBulb)
mySwitch.toggle()
