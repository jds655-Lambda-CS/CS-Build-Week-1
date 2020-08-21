//
//  CellState.swift
//  GameOfLife
//
//  Created by Lambda_School_Loaner_214 on 8/20/20.
//  Copyright © 2020 Empty Bliss. All rights reserved.
//

import Foundation


public enum CellState: Int {
    case dead
    case living
    
    //Retrieve next state for cell acording to rules
    func next(surroundingLivingCount count: Int) -> CellState {
        switch self {
        case .living:
            if count == 2 || count == 3 {
                return .living
            } else {
                return .dead
            }
        case .dead:
            if count == 3 {
                return .living
            } else {
                return .dead
            }
        }
    }
}
