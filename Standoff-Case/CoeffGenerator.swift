//
//  File.swift
//  Standoff-Case
//
//  Created by Andrey on 10.03.2023.
//

import Foundation

class CoeffGenerator {
//    static func crashGenerator() -> [Float] {
//        var crash = [Float]()
//        for _ in 1...45 {
//            let E: Float = 123456789.0
//            let H: Float = Float.random(in: 333...E+1)
//            let temp: Float = (E*666-H)/(680*(E-H))
//            if temp < 1.01 {
//                break
//            } else {
//                crash.append(temp)
//            }
//        }
//        return crash
//    }
    
    static func crashGenerator() -> [Float] {
        var crash = [Float]()
        for _ in 1...45 {
            let E: Float = pow(2, 32)
            let H: Float = Float.random(in: 1...E+1)
            let temp: Float = ((100*E-H) / (E-H)) / 100
            if temp < 1.01 {
                break
            } else {
                crash.append(temp)
            }
        }
        return crash
    }
}
