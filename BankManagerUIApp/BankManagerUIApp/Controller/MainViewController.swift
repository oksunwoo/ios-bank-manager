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
    let statusStackView = UIStackView()
    let processStackView = UIStackView()
    let waitingStackView = UIStackView()
    let workingStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    func configureView() {
        configureBackGroundView()
        configureButtonView()
        configureTimerView()
        configureStatusView()
        configureProcessView()
        configureWaitingView()
        configureWorkingView()
    }
    
    func configureBackGroundView() {
        backGroundStackView.axis = .vertical
        backGroundStackView.backgroundColor = .white
        //backGroundStackView.distribution = .fillEqually
        backGroundStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backGroundStackView)
        
        NSLayoutConstraint.activate([
            backGroundStackView.topAnchor.constraint(equalTo: view.topAnchor),
            backGroundStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backGroundStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backGroundStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureButtonView() {
        buttonStackView.axis = .horizontal
        buttonStackView.backgroundColor = .blue
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        backGroundStackView.addArrangedSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonStackView.widthAnchor.constraint(equalTo: backGroundStackView.widthAnchor),
            buttonStackView.heightAnchor.constraint(equalTo: backGroundStackView.heightAnchor, multiplier: 0.06)
        ])
    }
    
    func configureTimerView() {
        timerStackView.backgroundColor = .red
        timerStackView.translatesAutoresizingMaskIntoConstraints = false
        backGroundStackView.addArrangedSubview(timerStackView)
        
        NSLayoutConstraint.activate([
            timerStackView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor),
            timerStackView.widthAnchor.constraint(equalTo: buttonStackView.widthAnchor),
            timerStackView.heightAnchor.constraint(equalTo: buttonStackView.heightAnchor)
        ])
    }
    
    func configureStatusView() {
        statusStackView.backgroundColor = .green
        statusStackView.axis = .horizontal
        statusStackView.translatesAutoresizingMaskIntoConstraints = false
        backGroundStackView.addArrangedSubview(statusStackView)
        
        NSLayoutConstraint.activate([
            statusStackView.heightAnchor.constraint(equalTo: timerStackView.heightAnchor),
            statusStackView.topAnchor.constraint(equalTo: timerStackView.bottomAnchor)
        ])
    }
    
    func configureProcessView() {
        processStackView.axis = .horizontal
        processStackView.distribution = .fillEqually
        backGroundStackView.addArrangedSubview(processStackView)
    }
    
    func configureWaitingView() {
        waitingStackView.backgroundColor = .gray
        waitingStackView.axis = .vertical
        processStackView.addArrangedSubview(waitingStackView)
    }
    
    func configureWorkingView() {
        workingStackView.backgroundColor = .brown
        workingStackView.axis = .vertical
        processStackView.addArrangedSubview(workingStackView)
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
