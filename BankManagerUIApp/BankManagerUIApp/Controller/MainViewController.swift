//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    let backGroundStackView = UIStackView()
    let buttonStackView = UIStackView()
    let timerStackView = UIStackView()
    let bankStackView = UIStackView()
    let waitingStackView = UIStackView()
    let processingStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackGroundView()
    }
    
    func configureBackGroundView() {
        backGroundStackView.axis = .vertical
        backGroundStackView.backgroundColor = .white
        backGroundStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backGroundStackView)
        
        NSLayoutConstraint.activate([
            backGroundStackView.topAnchor.constraint(equalTo: view.topAnchor),
            backGroundStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backGroundStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backGroundStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}


//
//enum MenuOption: String {
//   case openBank = "1"
//   case exit = "2"
//}
//
////MARK: - 메서드
//func showMenu() {
//   let menu = """
//       1 : 은행개점
//       2 : 종료
//       입력 :
//       """
//   print(menu, terminator: " ")
//}
//
//func getUserInput() throws -> MenuOption {
//   guard let input = readLine(),
//         let menuOption = MenuOption(rawValue: input) else {
//       throw BankManagerError.invalidUserInput
//   }
//
//   return menuOption
//}
//
//func generateClients() -> [Client] {
//   let clientNumber = Int.random(in: 10...30)
//   var clients: [Client] = []
//
//   (1...clientNumber).forEach { number in
//       let orderTicket = Ticket(number: number)
//       let randomTaskIndex = Int.random(in: 0..<Task.allCases.count)
//       let randomTask = Task.allCases[randomTaskIndex]
//       let client = Client(orderTicket: orderTicket, task: randomTask)
//       clients.append(client)
//   }
//
//   return clients
//}
//
//func runProgram() {
//   while true {
//       do {
//           showMenu()
//           let userInput = try getUserInput()
//
//           switch userInput {
//           case .openBank:
//               let clients = generateClients()
//               bankManager.openBank(for: clients)
//           case .exit:
//               return
//           }
//       } catch BankManagerError.invalidUserInput {
//           print(BankManagerError.invalidUserInput.description)
//           print("다시 입력해주십시오.\n")
//       } catch {
//           print(error)
//       }
//   }
//}
//
//let bank = Bank(numberOfClerksForLoans: 1, numberOfClerksForDeposits: 2)
//var bankManager = BankManager(bank: bank)
//
//runProgram()
