class Queen {
    var column:Int
    var row:Int
    
    init(forRow:Int){
        row  = forRow
        column = 0
    }
    
}


// global variables to keep track of interesting stuff
var solutionsFound = 0
var positionsChecked = 0
let printSolutions = true
let boardWidth = 12

// create 8 queen objects, initialized to rows 0 - 7
let queens:[Queen] = map(0...boardWidth){ Queen(forRow: $0) }


func isSafe(currentRow:Int, currentColumn:Int) -> Bool {
    positionsChecked++
    
    for previousRow in 0 ..< currentRow {
        
        // check vertical
        if queens[previousRow].column == currentColumn {
            return false
        }
        
        // check diagonal
        let dRow = currentRow - previousRow
        let dCol = currentColumn - queens[previousRow].column
        if dRow == dCol || dRow == -dCol {
            return false
        }
        
    }
    
    // if we've gotten to this point it's a safe spot on the board
    queens[currentRow].column = currentColumn
    return true
    
}


/**

*/
func moveQueenAcrossRow(row:Int) {
    
    for column in 0...boardWidth {
    
        // Move queen column by column, checking if it's in a safe place
        if isSafe(row, column) {
            
            // if we've found the 8th queen, that's an ANSWER!
            if row == boardWidth {
                solutionsFound++
                if printSolutions {
                 printBoard()
                }
            } else {
                
                // recursive call to move the queen to the next row
                moveQueenAcrossRow(row+1)
            }
        }
    }
    
}

func printBoard() {
    
//    println("Solution #: \(solutionsFound)\n")
//    
//    // top down
//    for currentRow in reverse(0...boardWidth) {
//        print("\(currentRow+1)")
//        // left to right
//        for currentColumn in 0...boardWidth {
//            if queens[currentRow].column == currentColumn {
//                print(" Q ")
//            } else {
//                print(" - ")
//            }
//        }
//        println()
//    }
//    
//    println("  A  B  C  D  E  F  G  H \n\n")
//    
    
    
}

moveQueenAcrossRow(0)
println("Solutions Found: \(solutionsFound)\nPositions checked: \(positionsChecked)")
