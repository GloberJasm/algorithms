//: [Previous](@previous)

import Foundation

class Queue<T> {
    private var elements: [T] = []
    
    var first: T? {
        elements.first
    }
    
    var isEmpty: Bool {
        elements.isEmpty
    }
    
    init() { }
    
    func push(_ element: T) {
        elements.append(element)
    }
    
    func pop() -> T? {
        isEmpty ? nil : elements.removeFirst()
    }
}

@discardableResult
func isValidParentheses(input: String) -> Bool {
    let totalLenght = input.count
    guard totalLenght > 2 else {
        return false
    }
    let chars = Array(input)
    var isValid = true
    var firstIndex = 0
    var lastIndex = 0
    // Short the search
    for i in 0..<totalLenght { // O(n) Complexity
        if chars[i] == "(" {
            firstIndex = i
            break
        } else if chars[i] == ")" {
            isValid = false
            return isValid
        }
    }
    
    for i in stride(from: totalLenght - 1, through: firstIndex + 1, by: -1) { // O(n) Complexity
        if chars[i] == ")" {
            lastIndex = i + 1
            break
        } else if chars[i] == "(" {
            isValid = false
            return isValid
        }
    }

    var queue = Queue<String>()
    for i in firstIndex..<lastIndex { // O(n) Complexity
        if chars[i] == "(" {
            queue.push("*")
        } else if chars[i] == ")" {
            if queue.isEmpty {
                isValid = false
                return isValid
            } else {
                queue.pop()
            }
        }
    }
    return queue.isEmpty
}

let clock = ContinuousClock()

var input = "87+ 5/2 (87 + 8x +) (( x^2 - 70y)) 8y^3"
var result = clock.measure {
    print("isValid: \(isValidParentheses(input: input))")
}
print("time1: \(result)")

input = ")()()()()("
result = clock.measure {
    print("isValid: \(isValidParentheses(input: input))")
}
print("time2: \(result)")


input = "87+ 5/2 (87 + 8x +)()()()(( x^2 - 70y)) 8y^3"
result = clock.measure {
    print("isValid: \(isValidParentheses(input: input))")
}
print("time3: \(result)")

input = "87+ 5/2 (87 + 8x +))()()(( x^2 - 70y)) 8y^3"
result = clock.measure {
    print("isValid: \(isValidParentheses(input: input))")
}
print("time4: \(result)")
