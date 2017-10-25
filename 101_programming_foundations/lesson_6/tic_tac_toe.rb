require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMP_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd, player_wins, computer_wins)
  system 'clear'
  prompt "The first to 5 games wins!"
  prompt "Player wins: #{player_wins}"
  prompt "Computer wins: #{computer_wins}"
  prompt "You're an #{PLAYER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+------"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+------"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a valid square (#{joinor(empty_squares(brd))}): "
    square = gets.chomp.to_i
    if empty_squares(brd).include?(square)
      break
    else
      prompt "Sorry, that was not a valid choice."
    end
  end

  brd[square] = PLAYER_MARKER
end

# refactor
def computer_places_piece!(brd)
  defend_line = WINNING_LINES.select do |line|
    brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
      brd.values_at(*line).include?(' ')
  end

  if !!defend_line[0]
    square = defend_line[0].select { |sqr| brd[sqr] == ' ' }[0]
  else
    square = empty_squares(brd).sample
  end
  brd[square] = COMP_MARKER
end

def board_full?(brd)
  empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMP_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(arr, delimiter = ', ', joining_word = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first.to_s
  when 2 then arr.join(" #{joining_word} ")
  else
    arr[-1] = "#{joining_word} #{arr.last}"
    arr.join(delimiter)
  end
end

loop do
  player_wins = 0
  computer_wins = 0

  loop do
    board = initialize_board

    loop do
      display_board(board, player_wins, computer_wins)

      player_places_piece!(board)
      player_wins += 1 if detect_winner(board) == "Player"
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      computer_wins += 1 if detect_winner(board) == "Computer"
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, player_wins, computer_wins)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
    else
      prompt "It's a tie!"
    end

    if player_wins == 5 || computer_wins == 5
      prompt "Player wins the match!" if player_wins == 5
      prompt "Computer wins the match!" if computer_wins == 5
      break
    end
  end

  prompt "Do you want to play again? (y/n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing!"
