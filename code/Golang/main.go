package main

import "fmt"

func gameOfLife(board [][]int) {

	//making a copy of the board
	board_copy := make([][]int, len(board))
	for i := range board {
		board_copy[i] = make([]int, len(board[i]))
		copy(board_copy[i], board[i])
	}

	// board copy finished

	// traversing through all the cells in the board_copy
	for i := 0; i < len(board_copy); i++ {
		for j := 0; j < len(board_copy[i]); j++ {

			// counitng the total cells that are 1
			total_alive_neighbour := neighbour(board_copy, i+1, j) + neighbour(board_copy, i-1, j) + neighbour(board_copy, i, j+1) + neighbour(board_copy, i, j-1) + neighbour(board_copy, i+1, j+1) + neighbour(board_copy, i+1, j-1) + neighbour(board_copy, i-1, j+1) + neighbour(board_copy, i-1, j-1)

			// if the current call is alive
			if board_copy[i][j] == 1 {
				if total_alive_neighbour < 2 {
					board[i][j] = 0
					continue
				}
				if total_alive_neighbour == 1 || total_alive_neighbour == 2 {
					board[i][j] = 1
					continue
				}
				if total_alive_neighbour > 3 {
					board[i][j] = 0
					continue
				}

			}

			// if the current cell is dead
			if board_copy[i][j] == 0 {
				if total_alive_neighbour == 3 {
					board[i][j] = 1
					continue
				}
			}

		}
	}

}

// modified vbersion of BFS
func neighbour(board_copy [][]int, i int, j int) int {

	//  checks to keep index in bounds
	if i < 0 || i >= len(board_copy) || j < 0 || j >= len(board_copy[0]) {
		return 0
	}

	// if the corresponding cell is alive
	if board_copy[i][j] == 1 {

		return 1
	}
	return 0
}

func main() {
	fmt.Println("Game Of life")

	// original state can be changed here
	board := [][]int{{0, 1, 0}, {0, 0, 1}, {1, 1, 1}, {0, 0, 0}}
	fmt.Println("Original state")
	fmt.Println(board)
	gameOfLife(board)
	fmt.Println("Final State ")
	fmt.Println(board)
}
