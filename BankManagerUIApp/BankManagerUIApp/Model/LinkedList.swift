//
//  LinkedList.swift
//  BankManagerUIApp
//
//  Created by Sunwoo on 2022/02/05.
//

import Foundation

final class Node<Element> {
    var data: Element
    var next: Node?
    
    init(data: Element) {
        self.data = data
    }
}

final class LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    var firstNode: Node<Element>? {
        return head
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(_ data: Element) {
        let newNode = Node(data: data)
        
        if isEmpty {
            head = newNode
        } else {
            tail?.next = newNode
        }
        tail = newNode
    }
    
    func removeFirst() -> Element? {
        let node = head
        head = node?.next

        return node?.data
    }
    
    func removeAll() {
        head = nil
    }
}
