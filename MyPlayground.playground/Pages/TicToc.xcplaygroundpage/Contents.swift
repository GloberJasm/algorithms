//: [Previous](@previous)

import Foundation


var ticTacTocGame: TicTacToeGame? = nil
var moves: Game = []
var startReading: UInt64 = 0
var endReading: UInt64 = 0
var winner: Player? = nil

startReading = MemoryManagement.reportMemory()
ticTacTocGame = TicTacToeGame()
moves = [(0,0), (2,0), (1,1), (2,1), (2,2)]
winner = ticTacTocGame?.ticTacToe(game: moves)
print("winner: \(winner?.rawValue ?? "No terminado")")
endReading = MemoryManagement.reportMemory()
print("Memory at end: \(endReading - startReading) Kb")
ticTacTocGame = nil
moves = []
winner = nil



startReading = MemoryManagement.reportMemory()
ticTacTocGame = TicTacToeGame()
moves = [(0,0), (1,1), (0,1), (0,2), (1,0), (2,0)]
winner = ticTacTocGame?.ticTacToe(game: moves)
print("winner: \(winner?.rawValue ?? "No terminado")")
endReading = MemoryManagement.reportMemory()
print("Memory at end: \(endReading - startReading) Kb")
ticTacTocGame = nil
moves = []
winner = nil



startReading = MemoryManagement.reportMemory()
ticTacTocGame = TicTacToeGame()
moves = [(0,0), (1,1), (2,0), (1,0), (1,2), (2,1), (0,1), (0,2), (2,2)]
winner = ticTacTocGame?.ticTacToe(game: moves)
print("winner: \(winner?.rawValue ?? "No terminado")")
endReading = MemoryManagement.reportMemory()
print("Memory at end: \(endReading - startReading) Kb")
ticTacTocGame = nil
moves = []
winner = nil



startReading = MemoryManagement.reportMemory()
ticTacTocGame = TicTacToeGame()
moves = [(0,0), (1,1), (2,0), (1,0), (1,2), (2,1), (0,1), (0,2)]
winner = ticTacTocGame?.ticTacToe(game: moves)
print("winner: \(winner?.rawValue ?? "No terminado")")
endReading = MemoryManagement.reportMemory()
print("Memory at end: \(endReading - startReading) Kb")



startReading = MemoryManagement.reportMemory()
ticTacTocGame = TicTacToeGame()
moves = [(0,0), (1,1), (2,0), (1,0), (1,2)]
winner = ticTacTocGame?.ticTacToe(game: moves)
print("winner: \(winner?.rawValue ?? "No terminado")")
endReading = MemoryManagement.reportMemory()
print("Memory at end: \(endReading - startReading) Kb")


startReading = MemoryManagement.reportMemory()
ticTacTocGame = TicTacToeGame()
moves = [(0,0), (1,1), (0,1), (0,2), (1,0), (2,0)]
winner = ticTacTocGame?.ticTacToe(game: moves)
print("winner: \(winner?.rawValue ?? "No terminado")")
endReading = MemoryManagement.reportMemory()
print("Memory at end: \(endReading - startReading) Kb")
ticTacTocGame = nil
moves = []
winner = nil
