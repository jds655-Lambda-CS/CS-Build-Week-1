//
//  Board.swift
//  GameOfLife
//
//  Created by Lambda_School_Loaner_214 on 8/20/20.
//  Copyright © 2020 Empty Bliss. All rights reserved.
//

import Foundation

class Board<CellType> {
    typealias Element = CellType
    
    private (set) var size: Int
    private (set) var cells: [CellType]
    
    private var rows: [[CellType]] {
        cells.group(by: size)
    }
    init(size: Int, cells: [CellType]) {
        self.size = size
        self.cells = cells
    }
    
    subscript(_ index: Int) -> CellType {
        get {
            cells[index]
        }
        set(cell) {
            cells[index] = cell
        }
    }
    
    func apply(_ board: Board) {
        precondition(board.size <= size)
        
        for (y, row) in board.rows.enumerated() {
            for (x, cell) in row.enumerated() {
                let index = y * self.size + x
                self.cells[index] = cell
            }
        }
    }
    
    func surroundingCells(index: Int) -> [CellType] {
        let isLeftEdge = index % size == 0
        let isRightEdge = (index + 1) % size == 0
        
        let up = index - size
        let upLeft = isLeftEdge ? -1 : up-1
        let upRight = isRightEdge ? -1 : up+1
        let left = isLeftEdge ? -1 : index-1
        let right = isRightEdge ? -1 : index+1
        let down = index+size
        let downLeft = isLeftEdge ? -1 : down-1
        let downRight = isRightEdge ? -1: down+1
        return [up,upLeft,upRight, left, right, downLeft, down, downRight].compactMap { index in
            if 0 <= index && index < cells.count {
                return cells[index]
            } else {
                return nil
            }
        }
    }
}
