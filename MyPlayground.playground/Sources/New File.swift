import Foundation

public typealias Move = (x: Int, y: Int)
public typealias Game = [Move]

public enum Orientation {
    case horizontal
    case vertical
    case diagonal
}

public enum Player: String {
    case A
    case B
    case Draw
}

public class TicTacToeGame {

    public init() { }

    // 0,0 0,1 0,2
    // 1,0 1,1 1,2
    // 2,0 2,1 2,2
    //
    public func ticTacToe(game: Game) -> Player? {
        guard game.count > 4 else {
            return nil
        }
        var player: Player?
        var board = Board()
        for (index, move) in game.enumerated() {
            guard move.x < 3 || move.y < 3 else {
                return nil
            }
            board.positions[move.x][move.y] = index % 2 == 0 ? .A : .B // A Always play first
        }
        player = board.checkBoardWinner()
        if player == .A || player == .B {
            return player
        }
        player = board.checkBoardWinner(orientation: .vertical)
        if player == .A || player == .B {
            return player
        }
        player = board.checkBoardWinner(orientation: .diagonal)
        if player == .A || player == .B {
            return player
        }
        if !board.isPositionEmpty {
            return .Draw
        } else {
            return nil
        }
    }
}

public class Board {
    var positions: [[Player?]] = [[nil, nil, nil],
                                       [nil, nil, nil],
                                       [nil, nil, nil]]
    var description: String {
        var res = ""
        for (indexRow, _) in positions.enumerated() {
            for (_, position) in positions[indexRow].enumerated() {
                if let position = position {
                    res += position == .A ? "A " : "B "
                } else {
                    res += "X "
                }
            }
            res += "\n"
        }
        return res
    }
    
    lazy var isPositionEmpty: Bool = {
        for row in positions.enumerated() {
            if row.element.contains(where: { $0 == nil }) {
                return true
            }
        }
        return false
    }()

    func checkBoardWinner(orientation: Orientation = .horizontal) -> Player? {
        if orientation == .diagonal {
            guard let centerPosition = positions[1][1] else {
                return nil
            }
            var diagonalUpMarkCounter = 1
            var diagonalDownMarkCounter = 1
            for (indexRow, _) in positions.enumerated() {
                for (indexColumn, player) in positions[indexRow].enumerated() {
                    if (indexRow + indexColumn) % 2 == 0 && indexRow != 1 {
                        if indexRow == indexColumn && centerPosition == player {
                            diagonalUpMarkCounter += 1
                        } else if indexRow != indexColumn && centerPosition == player {
                            diagonalDownMarkCounter += 1
                        }
                    }
                }
            }
            if diagonalUpMarkCounter == 3 || diagonalDownMarkCounter == 3 {
                return centerPosition
            } else {
                return nil
            }
            
        } else {
            var playerOwner: Player? = nil
            var positionsMarked = 0
            for (indexRow, _) in positions.enumerated() {
                for (indexColumn, _) in positions[indexRow].enumerated() {
                    var player: Player?
                    if orientation == .horizontal {
                        player = positions[indexColumn][indexRow]
                    } else {
                        player = positions[indexRow][indexColumn]
                    }
                    if playerOwner == nil && player != nil {
                        playerOwner = player
                        positionsMarked += 1
                    } else if playerOwner != player {
                        playerOwner = nil
                        break // no need to continue to the last position
                    } else {
                        positionsMarked += 1
                    }
                }
                if positionsMarked == 3 {
                    return playerOwner
                }
            }
        }
        return .Draw
    }
}
