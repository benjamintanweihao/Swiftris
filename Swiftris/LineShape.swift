//
//  LineShape.swift
//  Swiftris
//
//  Created by Neo on 20/10/14.
//  Copyright (c) 2014 Neo. All rights reserved.
//

class LineShape:Shape {

    /*
        Orientations 0 and 180:

        | 0•|
        | 1 |
        | 2 |
        | 3 |

        Orientations 90 and 270:

        | 0 | 1•| 2 | 3 |

        • marks the row/column indicator for the shape

    */

    // Hinges about the second block


    override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orientation.Zero:       [( 0, 0), (1, 0), (2, 0), (3, 0)],
            Orientation.OneEighty:  [(-1, 0), (0, 0), (1, 0), (2, 0)],
            Orientation.Ninety:     [( 0, 0), (1, 0), (2, 0), (3, 0)],
            Orientation.TwoSeventy: [(-1, 0), (0, 0), (1, 0), (2, 0)]
        ]
    }

    override var bottomBlocksForOrientations: [Orientation: Array<Block>] {
        return [
            Orientation.Zero:       [blocks[FourthBlockIdx]],
            Orientation.OneEighty:   blocks,
            Orientation.Ninety:     [blocks[FourthBlockIdx]],
            Orientation.TwoSeventy:  blocks
        ]
    }
}