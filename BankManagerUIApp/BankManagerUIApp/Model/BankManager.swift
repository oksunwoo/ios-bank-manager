//
//  BankManager.swift
//  BankManagerUIApp
//
//  Created by Sunwoo on 2022/02/05.
//

import Foundation

struct BankManager {
    //MARK: - 저장 속성
    private let bank: Bank
    
    //MARK: - 생성자
    init(bank: Bank) {
        self.bank = bank
    }
    
    //MARK: - 메서드
    mutating func openBank(for clients: [Client]) {
        bank.receive(clients: clients)
        bank.executeBusiness()
    }
}
