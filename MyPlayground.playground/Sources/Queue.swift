import Foundation

public class Queue<T> {
    private var elements: [T] = []
    
    public var first: T? {
        elements.first
    }
    
    public var isEmpty: Bool {
        elements.isEmpty
    }
    
    public init() { }
    
    public func push(_ element: T) {
        elements.append(element)
    }
    
    public func pop() -> T? {
        isEmpty ? nil : elements.removeFirst()
    }
}
