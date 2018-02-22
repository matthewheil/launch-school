class Game
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
  end
  
  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
  end
  
  def display_goodbye_message
    puts "Goodbye and thanks for playing!"
  end

  

  def play
    display_welcome_message
    loop do
      board.display
      3.times do
        human.turn
        break if someone_won? || board_full?
        board.display
      end
      # computer.turn
      # break if someone_won? || board_full?
    end
    # display_result
    display_goodbye_message
  end
end

class Board
  attr_reader :squares
  INITIAL_VALUE = ' '

  def initialize
    @squares = {}
    (1..9).each { |key| @squares[key] = Square.new(INITIAL_VALUE) }
  end
  
  def display
    puts ""
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
    puts ""
  end

  def update_square(value, square)
    @squares[square] = value
  end
end

class Square
  attr_reader :value

  def initialize(value)
    @value = ' '
  end

  def value=(new_value)
    @value = new_value
  end

  def to_s
    value
  end
end

class Player
  def initialize
  end
end

class Human < Player
  def initialize
    @marker = 'X'
  end

  def turn
    puts "Choose an empty square between 1 and 9:"
    loop do
      choice = gets.chomp.to_i
      break if (1..9).include?(choice)
      puts "Invalid choice. Choose an empty square between 1 and 9."
    end
    board.update_square(choice, marker)
  end
end

class Computer < Player
end

class Score
  def initialize
  end
end

game = Game.new
game.play
