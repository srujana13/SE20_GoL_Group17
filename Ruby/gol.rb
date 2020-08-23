def game_of_life(board)
  board_copy = board
  board_copy.each_with_index do |row, i|
    row.each_with_index do |col, j|
      total_alive_neighbour = neighbour(board_copy, i + 1, j) +
                              neighbour(board_copy, i - 1, j) +
                              neighbour(board_copy, i, j + 1) +
                              neighbour(board_copy, i, j - 1) +
                              neighbour(board_copy, i + 1, j + 1) +
                              neighbour(board_copy, i + 1, j - 1) +
                              neighbour(board_copy, i - 1, j + 1) +
                              neighbour(board_copy, i - 1, j - 1)
      if board_copy[i][j] == 1
        if total_alive_neighbour < 2
          board[i][j] = 0
          next
        end
        if total_alive_neighbour == 1 || total_alive_neighbour == 2
          board[i][j] == 1
          next
        end
        if total_alive_neighbour > 3
          board[i][j] = 0
          next
        end
      end
      next unless board_copy[i][j] == 0
      if total_alive_neighbour == 3
        board[i][j] = 1
        next
      end
    end
  end
end

def neighbour(board_copy, i, j)
  return 0 if (i < 0) || (i >= board_copy.length) || (j < 0) ||
              (j >= board_copy[0].length)
  return 1 if board_copy[i][j] == 1
  0
end

puts('Game of Life')

# Modify the below values to try it out for various boards
board = [[0, 1, 0], [0, 0, 1], [1, 1, 1], [0, 0, 0]]

puts('Original State')
puts(board.map { |x| x.join(' ') })
# Given Board
# 0 1 0
# 0 0 1
# 1 1 1
# 0 0 0

game_of_life(board)

puts('Final State')
puts(board.map { |x| x.join(' ') })
# Generated Output for the given board
# 0 0 0
# 0 0 1
# 0 1 1
# 0 0 0
