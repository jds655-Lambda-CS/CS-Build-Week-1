//
//  Array+.swift
//  GameOfLife
//
//  Created by Lambda_School_Loaner_214 on 8/19/20.
//  Copyright © 2020 Empty Bliss. All rights reserved.
//

import Foundation

extension Array {
    func group(by size: Int) -> [[Element]] {
        assert(size > 0)
        
        var offset: Int = 0
        var result: [[Element]] = []
        while offset < count {
            let endIndex = Swift.min(offset + size, self.count)
            result.append(Array(self[offset..<endIndex]))
            offset += size
        }
        return result
    }
}
