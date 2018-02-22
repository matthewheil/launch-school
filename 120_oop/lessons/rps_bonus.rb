class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    @value = value
  end

  WINNING_MOVES = {
    'rock' => ['scissors', 'lizard'],
    'paper' => ['rock', 'spock'],
    'scissors' => ['paper', 'lizard'],
    'spock' => ['rock', 'scissors'],
    'lizard' => ['paper', 'spock']
  }

  def >(other_move)
    WINNING_MOVES[@value].include?(other_move.to_s)
  end

  def <(other_move)
    WINNING_MOVES[other_move.to_s].include?(@value)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :move_history
  attr_reader :score

  def initialize
    set_name
    @score = 0
    @move_history = []
  end

  def increase_score
    @score += 1
  end

  def clear_score
    @score = 0
  end

  def clear_history
    @move_history = []
  end

  def display_history
    puts "#{@name}'s moves: #{@move_history}"
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please select 'rock', 'paper', 'scissors', 'lizard', or 'spock':"
      choice = gets.chomp.downcase
      break if Move::VALUES.include? choice
      puts "Incorrect choice."
    end
    self.move = Move.new(choice)
    move_history << move
  end
end

class Computer < Player
  def set_name
    self.name = ['Bob', 'Rick', 'Susan', 'Sheryl', 'Mark', 'Maggie'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
    move_history << move
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer
  MATCH_WIN = 3

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!"
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizzard, Spock!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif computer.move > human.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def update_score
    if human.move > computer.move
      human.increase_score
    elsif computer.move > human.move
      computer.increase_score
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if answer.include?('y') || answer.include?('n')
      puts "Sorry, must be 'y' or 'n'."
    end
    return false if answer == 'n'
    return true if answer == 'y'
  end

  def display_score
    puts "#{human.name} has won #{human.score} games."
    puts "#{computer.name} has won #{computer.score} games."
  end

  def display_move_histories
    human.display_history
    computer.display_history
  end

  def clear_scores
    human.clear_score
    computer.clear_score
  end

  def clear_move_histories
    human.clear_history
    computer.clear_history
  end

  def won_ten?
    value = false
    if human.score >= MATCH_WIN || computer.score >= MATCH_WIN
      value = true
    end
    value
  end

  def display_match_winner
    if human.score >= MATCH_WIN
      puts "#{human.name} has won the match!"
    else
      puts "#{computer.name} has won the match!"
    end
  end

  def play_round
    human.choose
    computer.choose
    system 'clear'
    display_moves
    display_winner
    update_score
    display_score
  end

  def play
    display_welcome_message

    loop do
      system 'clear'
      loop do
        play_round
        break if won_ten?
      end
      display_match_winner
      display_move_histories
      clear_scores
      clear_move_histories
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
