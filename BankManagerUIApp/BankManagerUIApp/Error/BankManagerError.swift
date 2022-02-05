//
//  BankManagerError.swift
//  BankManagerUIApp
//
//  Created by Sunwoo on 2022/02/05.
//

import Foundation

enum BankManagerError: LocalizedError {
    case invalidUserInput
}

extension BankManagerError {
    var description: String {
        switch self {
        case .invalidUserInput:
            return "잘못된 입력입니다."
        }
    }
}
