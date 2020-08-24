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
   for i = 0, #board do
      for j = 0, #board[1] do

        n_count = check(board_copy,i-1,j-1) + check(board_copy,i-1,j) + check(board_copy,i-1,j+1)+ check(board_copy,i,j-1) + check(board_copy,i,j+1) + check(board_copy,i+1,j-1) + check(board_copy,i,j) + check(board_copy,i+1,j+1)

        if board_copy[i][j] == 0 then
          if n_count == 2 or n_count == 3 then
            board[i][j] = 1
				  else 
					  board[i][j] = 0
				  end
			  else
				  if n_count == 3 then
					  board[i][j] = 1
					end
				end
      end
    end
  return board
end

--check matrix boundaries
function check(a, rows, cols)
  if (rows > 1 and rows <= #a) and (cols > 0 and cols <=#a[1]) then
    return a[rows][cols]
  end
  return 0
end

function test(final_board)
  output = {{0,0,0},{1,0,1}, {0,1,1},{0,1,0}}
  testcase_check = 1
  for i = 1, #final_board  do
    for j = 1, #final_board[1] do
      if final_board[i][j] ~= output[i][j] then
        return 0
      end
    end
  end
  return 1
end



print('Game of Life')
board ={{0, 1, 0},{0, 0, 1},{1, 1, 1},{0, 0, 0}}
print('Original state')
for i = 1, #board do for j = 1, #board[1] do io.write(board[i][j]) end io.write("\n") end
final_board = gameoflife(board)
print('Final state')
for i = 1, #board do for j = 1, #board[1] do io.write(final_board[i][j]) end io.write("\n") end
if test(final_board) == 1 then
  print("Tese case passed")
else
  print("Test case failed")
end
