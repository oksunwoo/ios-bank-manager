//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Jun Bang on 2021/12/24.
//

import Foundation

struct Bank {
    //MARK: - 저장 속성
    private var clientQueue = WaitingQueue<Client>()
    private var clerkQueue = WaitingQueue<BankClerk>()
    
    //MARK: - 생성자
    init(numberOfClerks: Int) {
        (0..<numberOfClerks).forEach { _ in
            let clerk = BankClerk(isAvailable: true)
            clerkQueue.enqueue(clerk)
        }
    }
    
    // MARK: - Internal 메서드
    mutating func receive(clients: [Client]) {
        clients.forEach { client in
            clientQueue.enqueue(client)
        }
    }
    
    mutating func work() {
        let startTime = CFAbsoluteTimeGetCurrent()
        let totalClientCount = handleBankWork()
        let processTime = CFAbsoluteTimeGetCurrent() - startTime
        
        showClosingMessage(with: totalClientCount, and: processTime)
    }
    
    //MARK: - Private 메서드
    private mutating func handleBankWork() -> Int {
        var totalClientCount: Int = 0
        
        while let client = clientQueue.dequeue(),
              var clerk = clerkQueue.dequeue() {
            if clerk.isAvailable {
                clerk.work(for: client)
                totalClientCount += 1
            }
            clerkQueue.enqueue(clerk)
        }
        
        return totalClientCount
    }
    
    private func showClosingMessage(with totalClientCount: Int, and processTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalClientCount)명이며, 총 업무시간은 \(processTime.secondDecimalFormat)초입니다.")
    }
}

//MARK: - 중첩타입
extension Bank {
    private struct BankClerk {
        var isAvailable = true
        
        mutating func work(for client: Client) {
            let clientOrderNumber = client.orderTicket.number
            let duration = client.taskDuration
            
            isAvailable = false
            print("\(clientOrderNumber)번 고객 업무 시작")
            Thread.sleep(forTimeInterval: duration)
            print("\(clientOrderNumber)번 고객 업무 완료")
            isAvailable = true
        }
    }
}
