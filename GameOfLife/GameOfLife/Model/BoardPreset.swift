//
//  BoardPreset.swift
//  GameOfLife
//
//  Created by Lambda_School_Loaner_214 on 8/20/20.
//  Copyright © 2020 Empty Bliss. All rights reserved.
//

import Foundation

enum BoardPreset: Int, CaseIterable {
    case nebura
    case spaceShip
    
    var displayText: String {
        switch self {
        case .spaceShip: return "Space ship"
        case .nebura:    return "Nebura"
        }
    }

    var board: LifeGameBoard {
        switch self {
        case .spaceShip:
            return .init(size: 13, cells: [
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0,
                0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0,
                0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            ])

        case .nebura:
            return .init(size: 13, cells: [
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0,
                0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0,
                0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0,
                0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0,
                0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0,
                0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0,
                0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            ])
        }
    }
}
