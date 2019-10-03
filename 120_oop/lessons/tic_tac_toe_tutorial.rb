require 'pry'

module Clearable
  def clear
    system 'clear'
  end
end

module Messageable
  include Clearable

  def msg(message)
    clear
    puts ""
    puts message
    puts ""
  end
end

class Score
  GAMES_TO_WIN = 2
  INITIAL_SCORE = 0

  def initialize
    reset
  end

  def reached?
    @score == GAMES_TO_WIN
  end

  def increment
    @score += 1
  end

  def reset
    @score = INITIAL_SCORE
  end

  def to_s
    @score.to_s
  end
end

class Board
  STRATEGIC_SQUARE = 5
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def [](key)
    @squares[key].marker
  end

  def empty_keys
    @squares.select { |_, square| square.marker == Square::INITIAL_MARKER }.keys
  end

  def full?
    empty_keys.empty?
  end

  def someone_won?
    winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      current_squares = @squares.values_at(*line)
      if three_identical_markers?(current_squares)
        return current_squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |square| @squares[square] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}  "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}  "
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.uniq.size == 1
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize
    @marker = INITIAL_MARKER
  end

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker, :score, :name

  def initialize
    @score = Score.new
  end

  def can_win?(board)
    choose_winning_square(board) # returns nil if no winnng square is found
  end

  def choose_winning_square(board)
    square = nil
    Board::WINNING_LINES.each do |line|
      markers = [board[line[0]], board[line[1]], board[line[2]]]
      if markers.count(self.marker) == 2 && markers.count(' ') == 1
        square = line.select { |sqr| board[sqr] == ' ' }.first
      end
    end
    square
  end
end

class Computer < Player
  NAMES = %w[R2D2 C3PO Hal Cortana Alexa Siri]
  def initialize(human_marker)
    set_marker(human_marker)
    @name = NAMES.sample
    @score = Score.new
  end

  def set_marker(human_marker)
    @marker = human_marker == 'X' ? 'O' : 'X'
  end
end

class Human < Player
  include Messageable

  def initialize
    choose_marker
    choose_name
    super
  end

  def choose_name
    msg "Please enter your name: "
    @name = gets.chomp.split.map(&:capitalize).join(' ')
  end

  def choose_marker
    choice = ' '
    msg "Please choose a marker (X, O): "
    loop do
      choice = gets.chomp.upcase
      break if %w[X O].include?(choice)
      msg "Invalid choice. Please choose a marker (X, O): "
    end
    @marker = choice
  end
end

class TTTGame
  include Messageable

  FIRST_TO_MOVE = 'X'
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new(human.marker)
    @current_player = FIRST_TO_MOVE
  end

  def play_match
    loop do
      display_board
      loop do
        current_player_moves
        clear_screen_and_display_board
        break if board.someone_won? || board.full?
      end
      display_result
      reset_board
      break if human.score.reached? || computer.score.reached?
    end
  end

  def play_game
    display_welcome_message
    loop do
      play_match
      display_winner_of_match
      break unless play_again?
      play_again
    end
    display_goodbye_message
  end

  private

  def display_winner_of_match
    if human.score.reached?
      msg "#{human.name} won #{Score::GAMES_TO_WIN} games and won the match!"
    else
      msg "#{computer.name} won #{Score::GAMES_TO_WIN} games and won the match!"
    end
  end

  def display_score
    puts "#{human.name} has won #{human.score} games. #{computer.name} has won"\
    " #{computer.score} games."
  end

  def display_markers
    puts ""
    puts "#{human.name} is an #{human.marker}. #{computer.name} is an #{computer.marker}."
    puts ""
  end

  def display_welcome_message
    msg "Welcome to Tic Tac Toe #{human.name}!"
  end

  def display_goodbye_message
    msg "Thanks for playing Tic Tac Toe! Goodbye, #{human.name}!"
  end

  def available_squares
    joinor(board.empty_keys)
  end

  def joinor(arr, delimeter=', ', word='or')
    case arr.size
    when 1 then arr.first
    when 2 then arr.join(" #{word} ")
    else
      arr[-1] = "#{word} #{arr.last}"
      arr.join(delimeter)
    end
  end

  def current_player_moves
    @current_player == human.marker ? human_moves : computer_moves
  end

  def human_chooses_square
    square = ''
    loop do
      square = gets.chomp.to_i
      break if board.empty_keys.include?(square)
      puts "Invalid choice. Choose an available square"\
          " (#{available_squares}): "
    end
    square
  end

  def human_moves
    puts "Choose an available square (#{available_squares}): "
    square = human_chooses_square
    board[square] = human.marker
    @current_player = computer.marker
  end

  def computer_moves # offense, defense, pick square 5, or pick random
    if computer.can_win?(board)
      board[computer.choose_winning_square(board)] = computer.marker
    elsif human.can_win?(board)
      board[human.choose_winning_square(board)] = computer.marker
    elsif board.empty_keys.include?(Board::STRATEGIC_SQUARE)
      board[Board::STRATEGIC_SQUARE] = computer.marker
    else
      board[board.empty_keys.sample] = computer.marker
    end
    @current_player = human.marker
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_board
    display_score
    display_markers
    # display last move
    board.draw
    puts ""
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when human.marker
      puts "You won!"
      human.score.increment
    when computer.marker
      puts "The computer won!"
      computer.score.increment
    else puts "It's a tie!"
    end
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    answer = ''
    loop do
      answer = gets.chomp.downcase
      break if %w[y n].include?(answer)
      puts "Invalid choice. Play again? (y/n)"
    end
    answer == 'y'
  end

  def reset_board
    @current_player = FIRST_TO_MOVE
    board.reset
  end

  def reset_scores
    human.score.reset
    computer.score.reset
  end

  def play_again
    reset_board
    reset_scores
    human.choose_marker
    computer.set_marker(human.marker)
  end
end

game = TTTGame.new
game.play_game
