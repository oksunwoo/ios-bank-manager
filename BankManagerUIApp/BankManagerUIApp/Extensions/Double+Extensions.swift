//
//  Double+Extensions.swift
//  BankManagerUIApp
//
//  Created by Sunwoo on 2022/02/05.
//

import Foundation

extension Double {
    var secondDecimalFormat: String {
        return String(format: "%.2f", self)
    }
}
