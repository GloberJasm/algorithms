import UIKit

// Solution: We are using more memory so we can have more speed

// We can create some variations to reduce the storage like spliting the result list in 3 and insert every element in the section but that will make us iterate through the corresponding section so we can sort it but will slow dow the speed at the end always is one for another

@discardableResult
func sortCharacters(input: String) -> String {
    var numbers: [Int16] = []
    var upperCaseletters: [Int16] = []
    var lowerCaseletters: [Int16] = []
    var specialCharacters: [Character] = []
    var result: [Int16] = []

    var chars = Array(input)
    for (_, element) in chars.enumerated() {
        if let ascii = element.asciiValue {
            if ascii >= 48 && ascii <= 57 {
                if ascii % 2 == 0 {
                    numbers.append(Int16(ascii) + 100) // We just do it to identify it
                } else {
                    numbers.append(Int16(ascii))
                }
            } else if ascii >= 65 && ascii <= 90 { // Upper case
                upperCaseletters.append(Int16(ascii))
            } else if ascii >= 97 && ascii <= 122 { // Lower case
                lowerCaseletters.append(Int16(ascii))
            } else {
                specialCharacters.append(element)
            }
        }
//        else {
//            specialCharacters.append(element)
//        }
    }
    numbers.sort() //O(*n* log *n*) is using quickSort
//    numbers.quickSort()
    numbers.forEach {
        if $0 >= 148 {
            result.append($0 - 100)
        } else {
            result.append($0)
        }
    }
    result = lowerCaseletters.sorted() + upperCaseletters.sorted() + result
    return result.map { String(UnicodeScalar(UInt8($0))) }.joined() + specialCharacters
}

@discardableResult
func sortCharacters2(input: String) -> String {
    var result: [Int16] = [-1,-2,-3,-4,-5]
    var indexLowerCase = 0
    var indexUpperCase = 1
    var indexOddNumbers = 2
    var indexEveNumbers = 3
    var indexSpecialCharacters = 4
    var chars = Array(input)
    chars.sort()
    for (_, element) in chars.enumerated() {
        if let ascii = element.asciiValue {
            if ascii >= 48 && ascii <= 57 {
                if ascii % 2 == 0 {
                    result.insert(Int16(ascii), at: indexEveNumbers)
                    indexEveNumbers += 1
                    indexSpecialCharacters += 1
                } else {
                    result.insert(Int16(ascii), at: indexOddNumbers)
                    indexOddNumbers += 1
                    indexEveNumbers += 1
                    indexSpecialCharacters += 1
                }
            } else if ascii >= 65 && ascii <= 90 {// Upper case
                result.insert(Int16(ascii), at: indexUpperCase)
                indexUpperCase += 1
                indexOddNumbers += 1
                indexEveNumbers += 1
                indexSpecialCharacters += 1
            } else if ascii >= 97 && ascii <= 122 { // Lower case
                result.insert(Int16(ascii), at: indexLowerCase)
                indexLowerCase += 1
                indexUpperCase += 1
                indexOddNumbers += 1
                indexEveNumbers += 1
                indexSpecialCharacters += 1
            } else {
                result.insert(Int16(ascii), at: indexSpecialCharacters)
                indexSpecialCharacters += 1
            }
        }
//        else {
//            result.insert(element.utf16, at: indexSpecialCharacters)
//            indexSpecialCharacters += 1
//        }
    }
    return result.compactMap {
        if $0 < 0 {
            return nil
        } else {
            return String(UnicodeScalar(UInt8($0)))
        }
    }.joined()
}

let clock = ContinuousClock()

//print(sortCharacters(input: "Hel3lopla4Ygroun7d"))
let input = "#$%&()*+,-./34567‰Š‹ŒŽ•–—˜™š›œžŸ¡¢£80129:;<=>?@IJKLMNxyabOPQRSTUVWXYABCDEFGHZ[]^_qrstuvwcdefghijklmnopz{|}~€‚ƒ„…†‡ˆ¤¥¦§¨©ª«¬®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ"

print("result1: \(sortCharacters(input: input))")
print("result2: \(sortCharacters2(input: input))")

var startReading = MemoryManagement.reportMemory()

var result = clock.measure {
    sortCharacters(input: input)
}

print("time1: \(result)")

var endReading = MemoryManagement.reportMemory()
print("Memory at end 1: \(endReading - startReading) Kb")

startReading = MemoryManagement.reportMemory()

result = clock.measure {
    sortCharacters2(input: input)
}

print("time2: \(result)")

endReading = MemoryManagement.reportMemory()
print("Memory at end 2: \(endReading - startReading) Kb")

