//RY

import UIKit

var greeting = "Linked Lists"

example(of: "creating and linking nodes") {
    let node1 = Node(value: 1)
    let node2 = Node(value: 2)
    let node3 = Node(value: 3)
    
    node1.next = node2
    node2.next = node3
    
    print(node1)
}

example(of: "push") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print(list)
}

example(of: "append") {
    var list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)
    
    print(list)
}

example(of: "inserting at a particular index") {
    var list = LinkedList<Int>()
    list.push(7)
    list.push(2)
    list.push(1)
    
    print("Before inserting: \(list)")
    var middleNode = list.node(at: 1)!
    var value = 3
    for _ in 1...4 {
        middleNode = list.insert(value, after: middleNode)
        value += 1
    }
    print("After inserting: \(list)")
}


example(of: "pop") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Before popping list: \(list)")
    let poppedValue = list.pop()
    print("After popping list: \(list)")
    print("Popped value: " + String(describing: poppedValue))
}


example(of: "remove the last node") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Before removing last node: \(list)")
    let removedValue = list.removeLast()
    
    print("After removing last node: \(list)")
    print("Removing value: " + String(describing: removedValue))
}

example(of: "removing a node after a particular node") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Before removing at particular index: \(list)")
    let index = 1
    let node = list.node(at: index - 1)!
    let removedValue = list.remove(after: node)
    
    print("After removing at index \(index): \(list)")
    print("Remove value: " + String(describing: removedValue))
}


example(of: "using collection") {
    var list = LinkedList<Int>()
    for i in 0...9 {
        list.append(i)
    }
    
    print("List: \(list)")
    print("First element: \(list[list.startIndex])")
    print("Array containing first 3 elements: \(Array(list.prefix(3)))")
    print("Array containing last 3 elements: \(Array(list.suffix(3)))")
    
    let sum = list.reduce(0, +)
    print("Sum of all values: \(sum)")
}

example(of: "array cow") {
    let array1 = [1, 2]
    var array2 = array1
    
    print("array1: \(array1)")
    print("array2: \(array2)")
    
    print("---After adding 3 to array 2---")
    array2.append(3)
    print("array1: \(array1)")
    print("array2: \(array2)")
}


example(of: "linked list cow") {
    var list1 = LinkedList<Int>()
    list1.append(1)
    list1.append(2)
    print("List1 uniquely referenced: \(isKnownUniquelyReferenced(&list1.head))")
    var list2 = list1
    print("List1 uniquely referenced: \(isKnownUniquelyReferenced(&list1.head))")
    print("List1: \(list1)")
    print("List2: \(list2)")
    
    print("After appending 3 to list2")
    list2.append(3)
    print("List1: \(list1)")
    print("List2: \(list2)")
    
    print("Removing middle node on list2")
    if let node = list2.node(at: 2) {
        print("test List2: \(list2) ")
        print("test node:  \(node) ")
        list2.remove(after: node)
      
    }
    print("List2: \(list2)")
}

example(of: "my example 1") {
    var list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)
    list.append(4)
    list.append(5)
    print("\(list)")
    list[list.startIndex]
}

//MARK: - challange 1
//////////// author
func printInReverse<T>(_ list: LinkedList<T>) {
printInReverse(list.head)
}

private func printInReverse<T>(_ node: Node<T>?) {
guard let node = node else { return }
printInReverse(node.next)
print(node.value)
}


example(of: "printing in reverse") {
var list = LinkedList<Int>()
list.push(3)
list.push(2)
list.push(1)

print("Original list: \(list)")
print("Printing in reverse:")
printInReverse(list)
}
/// my examples


example(of: "reversed") {
    var linkedList = LinkedList<Int>()
    linkedList.push(1)
    linkedList.push(2)
    linkedList.push(3)
    linkedList.push(4)
    linkedList.push(5)
    linkedList.push(6)
    print(linkedList)
    
    linkedList
    linkedList.reverseList()
    print("TEST")
    print(linkedList)
    linkedList.reverseList()
    print(linkedList)
}


example(of: "myRecursiveReverseList") {
    var linkedList = LinkedList<Int>()
    linkedList.push(1)
    linkedList.push(2)
    linkedList.push(3)
    linkedList.push(4)
    linkedList.push(5)
    linkedList.push(6)
    
    print(linkedList)
    linkedList.recursiveReverseList()
    print(linkedList)
    
    
    linkedList.recursiveReverseList()
    print(linkedList)
}


//MARK:- Challenge 2: Find the middle node
//AUTHOR
func getMiddle<T>(_ list: LinkedList<T>) -> Node<T>? {
    var slow = list.head
    var fast = list.head
    
    while let nextFast = fast?.next {
        fast = nextFast.next
        slow = slow?.next
    }
    return slow
}

example(of: "getting the middle node") {
    var list = LinkedList<Int>()
    list.push(9)
    list.push(8)
    list.push(7)
    list.push(6)
    list.push(5)
    list.push(4)
    list.push(3)
    list.push(2)
    list.push(1)
    
    print(list)
    
    if let middleNode = getMiddle(list) {
        print(middleNode)
    }
}

// MY EXAMPLE
example(of: "my way of getting the middle node") {
    var list = LinkedList<Int>()
    list.push(9)
    list.push(8)
    list.push(7)
    list.push(6)
    list.push(5)
    list.push(4)
    list.push(3)
    list.push(2)
    list.push(1)
    print(list.getMiddle()!)
    
}


//MARK:- challenge 3
extension LinkedList {
    
    mutating func reverse() {
        tail = head
        var prev = head
        var current = head?.next
        prev?.next = nil
        
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        head = prev
    }
    
}
example(of: "reversing a list") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  print("Original list: \(list)")
  list.reverse()
  print("Reversed list: \(list)")
}


//MARK:- Challenge 4

//author version O(m + n)
func mergeSorted<T: Comparable>(_ left: LinkedList<T>,
                                _ right: LinkedList<T>) -> LinkedList<T> {
    guard !left.isEmpty else { return right }
    guard !right.isEmpty else { return left }
    
    var newHead: Node<T>?
    var tail: Node<T>?
    
    var currentLeft = left.head
    var currentRight = right.head
    
    if let leftNode = currentLeft, let rightNode = currentRight {
        if leftNode.value < rightNode.value {
            newHead = leftNode
            currentLeft = leftNode.next
        } else {
            newHead = rightNode
            currentRight = rightNode.next
        }
        tail = newHead
    }
    
    while let leftNode = currentLeft, let rightNode = currentRight {
        if leftNode.value < rightNode.value {
            tail?.next = leftNode
            currentLeft = leftNode.next
        } else {
            tail?.next = rightNode
            currentRight = rightNode.next
        }
        tail = tail?.next
    }
    
    if let leftNodes = currentLeft {
        tail?.next = leftNodes
    }
    
    if let rightNodes = currentRight {
        tail?.next = rightNodes
    }
    
    var list = LinkedList<T>()
    list.head = newHead
    list.tail = {
        while let next = tail?.next {
            tail = next
        }
        return tail
    }()
    return list
    
}

example(of: "merging two lists") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  var anotherList = LinkedList<Int>()
  anotherList.push(-1)
  anotherList.push(-2)
  anotherList.push(-3)
  print("First list: \(list)")
  print("Second list: \(anotherList)")
  let mergedList = mergeSorted(list, anotherList)
  print("Merged list: \(mergedList)")
}



// my version O(m + n)
func myMergeSorted<T: Comparable>(_ left: LinkedList<T>,
                                _ right: LinkedList<T>) -> LinkedList<T> {

    var newList = LinkedList<T>()
    var currentLeft = left.head
    var currentRight = right.head
    
    
    
    if left.isEmpty { newList = right }
    if right.isEmpty { newList = left }
    
    if let leftNode = currentLeft, let rightNode = currentRight {
        if leftNode.value < rightNode.value {
            newList.head = leftNode
            currentLeft = currentLeft?.next
        } else {
            newList.head = rightNode
            currentRight = currentRight?.next
        }
        newList.tail = newList.head
    }
    
    while let leftNode = currentLeft, let rightNode = currentRight {
        if leftNode.value < rightNode.value {
            newList.tail?.next = leftNode
            currentLeft = currentLeft?.next
        } else {
            newList.tail?.next = rightNode
            currentRight = currentRight?.next
        }
        newList.tail = newList.tail?.next
    }
    
    if let leftNodes = currentLeft {
        newList.tail?.next = leftNodes
    }
    if let rightNodes = currentRight {
        newList.tail?.next = rightNodes
    }
    
    while let next = newList.tail?.next {
        newList.tail = next
    }
    return newList
    
}


example(of:"merge") {
var list = LinkedList<Int>()
list.push(6)
list.push(4)
list.push(2)
print(list)

var list2 = LinkedList<Int>()
list2.push(5)
list2.push(3)
list2.push(1)
print(list2)

let mergeList = myMergeSorted(list, list2)
print(mergeList)

}

//////MARK:- Challenge 5

extension LinkedList where Value: Equatable {
    
    mutating func removeAll(_ value: Value) {
        while let head = self.head, head.value == value {
            self.head = head.next
        }
        
        var prev = head
        var current = head?.next
        
        while let currentNode = current {
            guard currentNode.value != value else {
                prev?.next = currentNode.next
                current = prev?.next
                continue
            }
            prev = current
            current = current?.next
        }
        tail = prev
        
    }
    
}


example(of: "deleting duplicate nodes") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(2)
  list.push(1)
  list.push(1)
  
  list.removeAll(3)
  print(list)
}
