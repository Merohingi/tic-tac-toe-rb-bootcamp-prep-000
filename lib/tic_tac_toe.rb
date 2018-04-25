WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5], 
  [6, 7, 8], 
  [0, 3, 6], 
  [1, 4, 7], 
  [2, 5, 8], 
  [0, 4, 8], 
  [2, 4, 6] 
]

board = Array.new(9," ")

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
  
def position_taken?(board, index)
  if board[index] == (" ") || board[index] == ("") || board[index] == (nil)
    return false
  else
    return true
  end
end

def move(board, index, position)
  board[index] = position
end

def position_taken?(board, index)
  board[index] == " " || board[index] == "" || board[index].empty?
end

def valid_move?(board, index)
  if index <= 8
    if position_taken?(board, index) == false
      return true
    elsif position_taken?(board, index) == true
      return false
    end
  else
    return false
  end
end

# def turn(board)
#   puts "Please enter 1-9:"
#   input = gets.chomp
#   index = input_to_index(input)
#   if valid_move?(board, index)
#     if turn_count(board) % 2 == 0
#       position = "X"
#     else
#       position = "O"
#     end
#     move(board, index, position)
#     display_board(board)
#   else
#     turn(board)
#   end
# end

def turn_count(board)
  occupied = 0
  board.each do |b|
    if b == "O" || b == "X"
      occupied += 1
    end
  end
  occupied
end

def current_player(board)
  count = turn_count(board)
  if count % 2 == 0
    count = "O"
  else
    count = "X"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    if board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X"
      return win_combo
    elsif board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O"
      return win_combo
    end
  end
  
def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def over?(board)
  if won?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    win_combo = won?(board)
    index = win_combo[0]
    if board[index] == "X"
      return "X"
    elsif board[index] == "O"
      return "O"
    end
  end
  return nil
end

def play(board)
  while (over?(board) != true && draw?(board) != true)
    turn(board) 
  end
  if over?(board) == true # If the game is over...
    if won?(board) != false # If there's a winner and win_combo available
      puts "Congratulations #{winner(board)}!" # 
    elsif draw?(board)
      puts "Cat's Game!"
    end
  end
end
end

def input_to_index(user_input)
  user_input.to_i - 1
end
  
def draw?(board)
  if (won?(board) == false && full?(board) == true)
    return true
  else
    return false
  end
end
  