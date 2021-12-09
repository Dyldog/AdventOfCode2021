//
//  main.swift
//  Day3
//
//  Created by Dylan Elliott on 6/12/21.
//

import Foundation
import Day2

extension Array where Element: Hashable {
    func counts() -> [Element: Int] {
        return self.reduce([Element: Int]()) { partialResult, value in
            var dict = partialResult
            dict[value, default: 0] += 1
            return dict
        }
    }
    
    func mostCommonElement() -> Element? {
        counts().max { $0.value < $1.value }?.key
    }
    
    func leastCommonElement() -> Element? {
        counts().min { $0.value < $1.value }?.key
    }
}

extension Array where Element == [String] {
    func splitByPosition() -> [[String]] {
        guard let first = first else { return [] }
        return self.reduce(Array(repeating: [], count: first.count)) { partialResult, value in
            return value.enumerated().map {
                return partialResult[$0.offset] + [value[$0.offset]]
            }
        }
    }
}

extension Array where Element == String {
    func makeBinary(using characterSelector: ([String]) -> String) -> Int {
        let hSplitStrings: [[String]] = self.map { str in str.map { String($0)} }
        let vSplitStrings = hSplitStrings.splitByPosition()
        let binaryValString = vSplitStrings.map { characterSelector($0) }.joined()
        let binaryVal = Int(binaryValString, radix: 2)
        return binaryVal!
    }
}

let a = input.makeBinary(using: { $0.mostCommonElement()! })
let b = input.makeBinary(using: { $0.mostCommonElement()! })
print("Part 1 :\(a * b)")

//print(binaryVal)
//
////let binaryVal: String = splitStrings.map { $0.mostCommonElement()! }.joined()
//
//
