//
//  WaitingQueue.swift
//  BankManagerUIApp
//
//  Created by Sunwoo on 2022/02/05.
//

import Foundation

final class WaitingQueue<Element> {
    private let list = LinkedList<Element>()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    func enqueue(_ item: Element) {
        list.append(item)
    }
    
    func dequeue() -> Element? {
        let firstItem = list.removeFirst()
        
        return firstItem
    }
    
    func clear() {
        list.removeAll()
    }
    
    func peek() -> Element? {
        let peekedNode = list.firstNode
        
        return peekedNode?.data
    }
}
