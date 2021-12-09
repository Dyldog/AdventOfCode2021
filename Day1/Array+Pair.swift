//
//  Array+Pair.swift
//  Day1
//
//  Created by Dylan Elliott on 3/12/21.
//

import Foundation

extension Array {
    func pair() -> Zip2Sequence<Array<Element>, Array<Element>> {
        return zip(Array(dropLast()), Array(dropFirst()))
    }
}
