//
//  File.swift
//  Standoff-Case
//
//  Created by Andrey on 10.03.2023.
//

import Foundation

class CoeffGenerator {
    static func crashGenerator() -> [Float] {
        var crash = [Float]()
        for _ in 1...45 {
            let E: Float = 123456789.0
            let H: Float = Float.random(in: 50...E+1)
            let temp: Float = (E*666-H)/(666*(E-H))
            crash.append(temp)
        }
        return crash
    }
}
