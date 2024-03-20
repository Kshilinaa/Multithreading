import UIKit


//задание : написать, что выведется в консоль
//ответить почему вызывается метод viewDidLoad
//попровить код чтобы распечаталось

class TaskSevenViewController: UIViewController {
     override func viewDidLoad() {
              super.viewDidLoad()
              print(2)
              DispatchQueue.main.async {
                      print(3)
                      DispatchQueue.main.async {
                            print(5)
                      }
               print(4)
             }
           print(6)
     }
}

let vc = TaskSevenViewController()
print(1)
let view = vc.view
print(7)


/*
 В консоль вывелось 1/2/6/7/3
 Вывод 4 и 5 не произойдет из-за того, что блок DispatchQueue.main.sync блокирует главный поток до завершения вложенного кода
 
 viewDidLoad() вызывается автоматически у uikit, когда экземпляр класса UIViewController загружается в память(когда его view загружается в память)
 */
