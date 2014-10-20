//
//  TShape.swift
//  Swiftris
//
//  Created by Neo on 20/10/14.
//  Copyright (c) 2014 Neo. All rights reserved.
//

class TShape:Shape {
    /*
    Orientation 0

      • | 0 |
    | 1 | 2 | 3 |

    Orientation 90

    • | 1 |
      | 2 | 0 |
      | 3 |

    Orientation 180

      •
    | 1 | 2 | 3 |
        | 0 |

    Orientation 270

      • | 1 |
    | 0 | 2 |
        | 3 |

    • marks the row/column indicator for the shape

    */


    override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orientation.Zero:       [(1, 0), (0, 1), (1, 1), (2, 1)],
            Orientation.OneEighty:  [(2, 1), (1, 0), (1, 1), (1, 2)],
            Orientation.Ninety:     [(2, 1), (0, 1), (1, 1), (2, 1)],
            Orientation.TwoSeventy: [(0, 1), (1, 0), (1, 1), (1, 2)]
        ]
    }

    override var bottomBlocksForOrientations: [Orientation: Array<Block>] {
        return [
            Orientation.Zero:       [blocks[SecondBlockIdx], blocks[ThirdBlockIdx], blocks[FourthBlockIdx]], // 1, 2, 3
            Orientation.OneEighty:  [blocks[FirstBlockIdx], blocks[FourthBlockIdx]], // 0, 3
            Orientation.Ninety:     [blocks[FirstBlockIdx], blocks[SecondBlockIdx], blocks[FourthBlockIdx]], // 0, 1, 3
            Orientation.TwoSeventy: [blocks[FirstBlockIdx], blocks[FourthBlockIdx]] // 0, 3
        ]
    }
}
