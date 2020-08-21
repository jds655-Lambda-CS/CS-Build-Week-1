//
//  LifeGameBoard.swift
//  GameOfLife
//
//  Created by Lambda_School_Loaner_214 on 8/20/20.
//  Copyright © 2020 Empty Bliss. All rights reserved.
//

import Foundation

public struct LifeGameBoard {
    private var board: Board<CellState>
    
    // MARK: Computed Properties
    
    public var size: Int {
        board.size
    }
    
    public var cells: [CellState] {
        board.cells
    }
    
    public var rows: [[CellState]] {
        board.cells.group(by: size)
    }
    
    // MARK: Initializer
    
    public init(size: Int, cells: [CellState]) {
        board = Board(size: size, cells: cells)
    }

    public init(size: Int, cells: [Int]) {
        board = Board(size: size, cells: cells.map { $0 >= 1 ? .living : .dead })
    }

    public init(size: Int) {
        board = Self.emptyBoard(size: size)
    }

    // MARK: Public
    
    public mutating func next() {
        let cells = board.cells.enumerated().map { index, _ in nextCellState(index) }
        self.board = Board(size: size, cells: cells)
    }
    
    public mutating func toggle(x: Int, y: Int) {
        let index = x + y * size
        let state: CellState = board[index]
        board[index] = state == .living ? .dead : .living
    }
    
    public mutating func clear() {
        board = Self.emptyBoard(size: size)
    }
    
    public mutating func apply(size: Int, cells: [Int]) {
        board.apply(Board<CellState>(size: size, cells: cells.map { $0 >= 1 ? .living : .dead }))
    }
    
    // MARK: Private

    private static func emptyBoard(size: Int) -> Board<CellState> {
        Board(size: size, cells: Array(repeating: .dead, count: size * size))
    }

    private func nextCellState(_ index: Int) -> CellState {
        let livingCount = board.surroundingCells(index: index).filter { $0 == .living }.count
        return board[index].next(surroundingLivingCount: livingCount)
    }
}
