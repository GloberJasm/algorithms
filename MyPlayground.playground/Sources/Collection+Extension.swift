import Foundation


public extension Array where Element: Comparable {
    func quickSort() -> [Element] {
        guard self.count > 1 else { return self }
    
        let pivot = self[self.count / 2]
        let less = self.filter { $0 < pivot }
        let equal = self.filter { $0 == pivot }
        let greater = self.filter { $0 > pivot }
        return less.quickSort() + equal + greater.quickSort()
    }
}
