
-- To execute: lua GameOfLife.lua

function gameoflife(board)
    board_copy = {}
    for i = 1, #board  do
      board_copy[i] = {}
        for j = 1, #board[1] do
          board_copy[i][j] = board[i][j]
        end
    end

   --check all 8 neighbours
   for i = 1, #board do
      for j = 1, #board[1] do

        n_count = check(board_copy,i-1,j-1) + check(board_copy,i-1,j) + check(board_copy,i-1,j+1)+ check(board_copy,i,j-1) + check(board_copy,i,j+1) + check(board_copy,i+1,j-1) + check(board_copy,i+1,j) + check(board_copy,i+1,j+1)

        if ( board_copy[i][j]==0 ) then
          board[i][j] = bool_to_number(n_count==3)
        else
          board[i][j] = bool_to_number(n_count==2 or n_count== 3)
        end
      end
    end
  return board
end

--check matrix boundaries
function check(a, rows, cols)
  if (rows >=1 and rows <= #a) and (cols>=1 and cols <=#a[1]) then
    return a[rows][cols]
  end
  return 0
end

function bool_to_number(value)
  return value and 1 or 0
end

print('Game of Life')
board ={{0, 1, 0},{0, 0, 1},{1, 1, 1},{0, 0, 0}}
print('Original state')
for i = 1, #board do for j = 1, #board[1] do io.write(board[i][j]) end io.write("\n") end
final_board = gameoflife(board)
print('Final state')
for i = 1, #board do for j = 1, #board[1] do io.write(final_board[i][j]) end io.write("\n") end
