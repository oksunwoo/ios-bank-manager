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
    let addCustomerButton = UIButton()
    let resetButton = UIButton()
    let titleTextLabel = UILabel()
    let timeTextLabel = UILabel()
    let waitingLabel = UILabel()
    let workingLabel = UILabel()
    
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
        buttonStackView.distribution = .fillEqually
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        backGroundStackView.addArrangedSubview(buttonStackView)
        
        addCustomerButton.setTitle("고객 10명 추가", for: .normal)
        addCustomerButton.setTitleColor(.systemBlue, for: .normal)
        addCustomerButton.addTarget(self, action: #selector(addCustomer), for: .touchUpInside)
        
        resetButton.setTitle("초기화", for: .normal)
        resetButton.setTitleColor(.systemRed, for: .normal)
        resetButton.addTarget(self, action: #selector(resetBank), for: .touchUpInside)
    
        buttonStackView.addArrangedSubview(addCustomerButton)
        buttonStackView.addArrangedSubview(resetButton)
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonStackView.widthAnchor.constraint(equalTo: backGroundStackView.widthAnchor),
            buttonStackView.heightAnchor.constraint(equalTo: backGroundStackView.heightAnchor, multiplier: 0.06)
        ])
    }
    
    func configureTimerView() {
        timerStackView.distribution = .fillEqually
        timerStackView.translatesAutoresizingMaskIntoConstraints = false
        backGroundStackView.addArrangedSubview(timerStackView)
        
        titleTextLabel.text = "업무시간 -"
        titleTextLabel.textAlignment = .right
        titleTextLabel.font = .preferredFont(forTextStyle: .title2)
        titleTextLabel.textColor = .black
        titleTextLabel.adjustsFontForContentSizeCategory = true
        
        timeTextLabel.text = " 00:00:000"
        timeTextLabel.textAlignment = .left
        timeTextLabel.font = .preferredFont(forTextStyle: .title2)
        timeTextLabel.textColor = .black
        timeTextLabel.adjustsFontForContentSizeCategory = true
        
        timerStackView.addArrangedSubview(titleTextLabel)
        timerStackView.addArrangedSubview(timeTextLabel)
        
        NSLayoutConstraint.activate([
            timerStackView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor),
            timerStackView.widthAnchor.constraint(equalTo: buttonStackView.widthAnchor),
            timerStackView.heightAnchor.constraint(equalTo: buttonStackView.heightAnchor)
        ])
    }
    
    func configureStatusView() {
        statusStackView.axis = .horizontal
        statusStackView.distribution = .fillEqually
        statusStackView.translatesAutoresizingMaskIntoConstraints = false
        backGroundStackView.addArrangedSubview(statusStackView)
        
        waitingLabel.text = "대기중"
        waitingLabel.textAlignment = .center
        waitingLabel.font = .preferredFont(forTextStyle: .largeTitle)
        waitingLabel.textColor = .white
        waitingLabel.backgroundColor = .systemGreen
        waitingLabel.adjustsFontForContentSizeCategory = true
        
        workingLabel.text = "업무중"
        workingLabel.textAlignment = .center
        workingLabel.font = .preferredFont(forTextStyle: .largeTitle)
        workingLabel.textColor = .white
        workingLabel.backgroundColor = .systemIndigo
        workingLabel.adjustsFontForContentSizeCategory = true
        
        statusStackView.addArrangedSubview(waitingLabel)
        statusStackView.addArrangedSubview(workingLabel)
        
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
    
    @objc func addCustomer() {
        print("10명 추가")
    }
    
    @objc func resetBank() {
        print("초기화")
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
