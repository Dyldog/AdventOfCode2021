//
//  main.swift
//  Day2
//
//  Created by Dylan Elliott on 6/12/21.
//

import Foundation

struct Movement {
    enum Direction: String {
        case forward
        case down
        case up
    }
    
    let direction: Direction
    let length: Int
    
    init(string: String) {
        let comps = string.components(separatedBy: " ")
        direction = Direction(rawValue: comps[0])!
        length = Int(comps[1])!
    }
    
    var vector: (Int, Int) {
        switch direction {
        case .forward: return (length, 0)
        case .down: return (0, length)
        case .up: return (0, -length)
        }
    }
}

let runPart1 = false
if runPart1 {
    let movements = input
        .map { Movement(string: $0).vector }

    let total = movements.reduce((0, 0), { ($0.0 + $1.0, $0.1 + $1.1) })

    var product = total.0 * total.1

    print(product)
}

extension Movement {
    func vector(aim: Int) -> (x: Int, y: Int, aim: Int) {
        switch direction {
        case .forward: return (length, length * aim, 0)
        case .down: return (0, 0, +length)
        case .up: return (0, 0, -length)
        }
    }
}
let aimedCoords = input.map { Movement(string: $0) }
    .reduce((0, 0, 0), {
        let vector = $1.vector(aim: $0.2)
        let pos = ($0.0 + vector.0, $0.1 + vector.1, $0.2 + vector.2)
        print($0, $1, vector, pos)
        return pos
    })

let aimedProduct = aimedCoords.0 * aimedCoords.1

print("Part 2: \(aimedProduct)")
