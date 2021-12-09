//
//  Array+Batch.swift
//  Day1
//
//  Created by Dylan Elliott on 3/12/21.
//

import Foundation

extension Array {
    func batch(_ size: Int = 3) -> [Array] {
        return (0...self.count-size).map { idx in
            (0..<size).map { sidx in self[idx + sidx] }
        }
    }
}
