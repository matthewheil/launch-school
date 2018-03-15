class Player
  CHOICES = %w[r p s]

  def initialize
    @wins = 0
  end

  attr_reader :choice, :wins

  def choose
    self.choice = CHOICES.sample
  end

  def increment_wins
    self.wins += 1
  end

  def reset_wins
    self.wins = 0
  end

  private

  attr_writer :choice, :wins
end

class Human < Player
  attr_reader :name

  def initialize
    super
    @name = name?
  end

  def name?
    puts "Please enter your name: "
    name = nil
    loop do
      name = gets.chomp.capitalize
      break unless name.empty?
      puts "Please enter your name: "
    end
    name
  end

  def choose
    puts "Choose rock, paper, or scissors (r/p/s): "
    loop do
      self.choice = gets.chomp.downcase
      break if %w[r p s].include?(choice)
      puts "Invalid choice. Choose rock, paper, or scissors (r/p/s): "
    end
  end
end

class Computer < Player
  attr_reader :name

  def initialize
    super
    @name = 'Hal'
  end
end

class RPSGame
  WIN = { 'r' => 's', 'p' => 'r', 's' => 'p' }
  TO_ENGLISH = { 'r' => "Rock", 's' => "Scissors", 'p' => 'Paper' }
  PLAY_TO = 2
  SLEEP_TIMING = 2.5 # in seconds

  attr_reader :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def clear
    system('cls') || system('clear')
  end

  def display_welcome
    clear
    puts "Welcome to Rock Paper Scissors game, #{human.name}!"
    puts "The first to #{PLAY_TO} wins!"
  end

  def display_goodbye
    clear
    puts "Thanks for playing, #{human.name}!"
  end

  def determine_winner
    if WIN[human.choice].include?(computer.choice)
      human
    elsif WIN[computer.choice].include?(human.choice)
      computer
    else
      "tie"
    end
  end

  def display_wins
    win_mode = Hash.new("wins")
    win_mode[1] = "win"
    clear
    puts "#{human.name} has #{human.wins} #{win_mode[human.wins]}."
    puts "#{computer.name} has #{computer.wins} #{win_mode[computer.wins]}."
  end

  def display_winner(winner)
    clear
    puts "#{human.name} chose #{TO_ENGLISH[human.choice]}"
    puts "#{computer.name} chose #{TO_ENGLISH[computer.choice]}"
    if winner == 'tie'
      puts "It was a tie!"
    else
      puts "#{winner.name} won!"
    end
    sleep(SLEEP_TIMING)
  end

  def tie?
    human.choice == computer.choice
  end

  def display_match_winner(winner)
    display_wins
    puts "#{winner.name} won the match!"
    sleep(SLEEP_TIMING)
  end

  def play_again?
    clear
    puts "Would you like to play again? (y/n): "
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if %w[y n].include?(answer)
      puts "Invalid choice. Would you like to play again? (y/n): "
    end
    answer == 'y'
  end

  def reset_game
    human.reset_wins
    computer.reset_wins
  end

  def play
    display_welcome
    loop do
      winner = nil
      loop do
        display_wins
        human.choose
        computer.choose
        winner = determine_winner
        display_winner(winner)
        next if tie?
        winner.increment_wins
        break if winner.wins >= PLAY_TO
      end
      display_match_winner(winner)
      break unless play_again?
      reset_game
    end
    display_goodbye
  end
end

game = RPSGame.new
game.play
