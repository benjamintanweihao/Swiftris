//
//  Swiftris.swift
//  Swiftris
//
//  Created by Neo on 20/10/14.
//  Copyright (c) 2014 Neo. All rights reserved.
//

let NumColumns = 10
let NumRows    = 20

let StartingColumn = 4
let StartingRow    = 0

let PreviewColumn = 12
let PreviewRow    = 1

protocol SwiftrisDelegate {
    // invoked when the current round of Swiftris ends
    func gameDidEnd(swiftris: Swiftris)

    // invoked immediately after a new game has begun
    func gameDidBegin(swiftris: Swiftris)

    // Invoked when the falling shape has become part of the game board
    func gameShapeDidLand(swiftris: Swiftris)

    // Invoked when the falling shaped has changed its location after being dropped
    func gameShapeDidDrop(swiftris: Swiftris)

    // Invoked hen the game has reached a new level
    func gameDidLevelUp(swiftris: Swiftris)
}


class Swiftris {
    var blockArray:Array2D<Block>
    var nextShape:Shape?
    var fallingShape:Shape?
    var delegate:SwiftrisDelegate?

    init() {
        fallingShape = nil
        nextShape    = nil
        blockArray = Array2D<Block>(columns: NumColumns, rows: NumRows)
    }

    func beginGame() {
        if (nextShape == nil) {
            nextShape = Shape.random(PreviewColumn, startingRow: PreviewRow)
        }
    }

    func newShape() -> (fallingShape:Shape?, nextShape:Shape?) {
        fallingShape = nextShape
        nextShape = Shape.random(PreviewColumn, startingRow: PreviewRow)
        fallingShape?.moveTo(StartingColumn, row: StartingRow)
        return (fallingShape, nextShape)
    }
}