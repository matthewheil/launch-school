PLAYER_ONE = 'choose'
PLAYERS = ['player', 'computer']
INITIAL_MARKER = ' '
MIDDLE_SQUARE = 5
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

def find_defensive_line(brd)
  defensive_line = WINNING_LINES.select do |line|
    brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
      brd.values_at(*line).include?(INITIAL_MARKER)
  end

  defensive_line.flatten if !!defensive_line[0] # if defensive_line has a value
end

def find_offensive_line(brd)
  offensive_line = WINNING_LINES.select do |line|
    brd.values_at(*line).count(COMP_MARKER) == 2 &&
      brd.values_at(*line).include?(INITIAL_MARKER)
  end

  offensive_line.flatten if !!offensive_line[0] # if offensive_line has a value
end

# rubocop:disable Metrics/AbcSize
def computer_places_piece!(brd)
  defend_line = find_defensive_line(brd)
  attack_line = find_offensive_line(brd)
  if !defend_line && !attack_line
    square = empty_squares(brd).sample
    square = MIDDLE_SQUARE if brd[MIDDLE_SQUARE] == INITIAL_MARKER
  elsif !attack_line
    square = defend_line.select { |sqr| brd[sqr] == INITIAL_MARKER }.first
  else
    square = attack_line.select { |sqr| brd[sqr] == INITIAL_MARKER }.first
  end
  brd[square] = COMP_MARKER
end
# rubocop:enable Metrics/AbcSize

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

def take_turn!(active_player, brd)
  if active_player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def choose_player_one
  choice = ''
  loop do
    prompt "Would you like to go first? (y/n)"
    choice = gets.chomp.downcase[0]
    if choice == 'y' || choice == 'n'
      break
    else
      prompt "Please enter a valid choice of yes or no."
    end
  end
  if choice == 'y'
    'player'
  else
    'computer'
  end
end

def alternate_player(current_player)
  PLAYERS.select { |player| player != current_player }.first
end

loop do
  player_wins = 0
  computer_wins = 0
  player_one = PLAYER_ONE
  player_two = ''

  loop do
    board = initialize_board
    player_one = choose_player_one if player_one == 'choose'
    player_two = PLAYERS.select { |player| player != player_one }.first
    current_player = player_one

    # rubocop:disable Style/IfInsideElse
    loop do
      display_board(board, player_wins, computer_wins)

      take_turn!(current_player, board)
      display_board(board, player_wins, computer_wins)
      if current_player == 'player'
        player_wins += 1 if detect_winner(board) == "Player"
      else
        computer_wins += 1 if detect_winner(board) == "Computer"
      end
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end
    # rubocop:enable Style/IfInsideElse

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
