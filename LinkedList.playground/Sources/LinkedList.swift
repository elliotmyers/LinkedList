// RY

import Foundation


// Linked List


public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    public var count = 0
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public mutating func push(_ value: Value) {
        copyNodes()
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
        count += 1
    }
    
    public mutating func append(_ value: Value) {
        defer { count += 1 }
        copyNodes()
        guard !isEmpty else {
            push(value)
            return
        }
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    public func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }
    
    @discardableResult
    public mutating func insert(_ value: Value,
                                after node: Node<Value>) -> Node<Value> {
        defer {
            count += 1
        }
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        var newNode = node
        
        if head === node {
            print(CFGetRetainCount(head))
            if CFGetRetainCount(head) > 5  {
                newNode = copyNodes(returningCopyOf: node)! }
        } else {
            print(CFGetRetainCount(head))
            if CFGetRetainCount(head) > 2  {
                newNode = copyNodes(returningCopyOf: node)!  }
        }
        
        
        
        
        newNode.next = Node(value: value, next: newNode.next)
        return newNode.next!
    }
    
    @discardableResult
    public mutating func pop() -> Value? {
        copyNodes()
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
            count -= 1
        }
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> Value? {
        defer {
            count -= 1
        }
        copyNodes()
        guard let head = head else {
            return nil
        }
        guard head.next != nil else {
            return pop()
        }
        var prev = head
        var current = head
        while let next = current.next {
            prev = current
            current = next
        }
        prev.next = nil
        tail = prev
        return current.value
    }
    
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        guard let node = copyNodes(returningCopyOf: node) else
        { return nil }
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
            count -= 1
        }
        return node.next?.value
    }
    
    private mutating func copyNodes() {
        
        
        guard !isKnownUniquelyReferenced(&head) else {
            return
        }
        
        guard var oldNode = head else {
            return
        }
        
        head = Node(value: oldNode.value)
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            
            oldNode = nextOldNode
        }
        tail = newNode
    }
    
    private mutating func copyNodes(returningCopyOf node: Node<Value>?) -> Node<Value>? {
        
        if tail !== head {
            if head === node {
                guard !isKnownUniquelyReferenced(&tail) else { return node }
            } else {
                guard !isKnownUniquelyReferenced(&head) else { return node }
            }
        } else {
            guard CFGetRetainCount(head) > 4 else {
                return node
            }
        }
        
        guard var oldNode = head else {
            return nil
        }
        
        head = Node(value: oldNode.value)
        var newNode = head
        var nodeCopy: Node<Value>?
        
        while let nextOldNode = oldNode.next {
            if oldNode === node {
                nodeCopy = newNode
            }
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }
        tail = newNode
        return nodeCopy
    }
    
    
    public mutating func reverseList() {
        guard head !== tail else {
            return
        }
        guard var prev = head else {
            return
        }
        copyNodes()
        
        tail = prev
        
        var current = prev.next
        prev.next = nil
        
        
        while current != nil {
            let newHead = current!.next
            
            current!.next = prev
            prev = current!
           
            current = newHead
            
            
        }
        head = prev
    
    }
    
    
    public mutating func recursiveReverseList() {
        
        guard head !== tail else {
            return
        }
        
        guard head != nil else {
            return
        }
        
        tail = doRecursion(head!)
        tail?.next = nil
    }
    
    @discardableResult
    private mutating func  doRecursion(_ node: Node<Value>) -> Node<Value> {
        
        let newNode = Node(value: node.value, next: node.next)
        
        if newNode.next != nil {
            let nextNode = doRecursion(newNode.next!)
            nextNode.next = newNode
        } else {
            head = newNode
        }
        
        return newNode
    }
    //////new
    public func getMiddle() -> Node<Value>? {
        let middleIndex = count / 2
        return node(at: middleIndex)
    }
    
    
}



extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}


extension LinkedList: Collection {
    
    public struct Index: Comparable {
        
        public var node: Node<Value>?
        
        static public func ==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static public func < (lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains{ $0 === rhs.node }
        }
    }
    
    
    public var startIndex: Index {
        Index(node: head)
    }
    
    public var endIndex: Index {
        Index(node: tail?.next)
    }
    
    public func index(after i: Index) -> Index {
        Index(node: i.node?.next)
    }
    
    public subscript(position: Index) -> Value {
        position.node!.value
    }
    
    
}



