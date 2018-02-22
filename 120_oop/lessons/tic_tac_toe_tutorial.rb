class Score
  GAMES_TO_WIN = 5
  INITIAL_SCORE = 0

  def initialize
    @score = INITIAL_SCORE
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
  attr_reader :marker, :score

  def initialize(marker)
    @marker = marker
    @score = Score.new
  end
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  FIRST_TO_MOVE = HUMAN_MARKER
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
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
      msg "You won #{Score::GAMES_TO_WIN} games and won the match!"
    else
      msg "The computer won #{Score::GAMES_TO_WIN} games and won the match!"
    end
  end

  def display_score
    msg "You have won #{human.score} games. The computer has won"\
    " #{computer.score} games."
  end

  def display_welcome_message
    msg "Welcome to Tic Tac Toe!"
  end

  def display_goodbye_message
    msg "Thanks for playing Tic Tac Toe! Goodbye!"
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
    @current_player == HUMAN_MARKER ? human_moves : computer_moves
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
    @current_player = COMPUTER_MARKER
  end

  def computer_moves
    board[board.empty_keys.sample] = computer.marker
    @current_player = HUMAN_MARKER
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_board
    display_score
    puts "You're an #{human.marker}. Computer is an #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when TTTGame::HUMAN_MARKER
      puts "You won!"
      human.score.increment
    when TTTGame::COMPUTER_MARKER
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

  def display_play_again
    msg "Let's play again!"
  end

  def msg(message)
    clear
    puts ""
    puts message
    puts ""
  end

  def clear
    system 'clear'
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
    display_play_again
  end
end

game = TTTGame.new
game.play_game
