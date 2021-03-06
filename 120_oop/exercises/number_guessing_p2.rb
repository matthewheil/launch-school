class Player
  def guess_number
    guess = 0
    puts guess_prompt
    loop do
      guess = gets.chomp
      break if (guess.to_i.to_s == guess) && valid_guess(guess.to_i)
      print "Invalid guess. #{guess_prompt}"
    end
    guess.to_i
  end

  def guess_prompt
    "Enter a number between #{GuessingGame::low_number} and "\
      "#{GuessingGame::high_number}: "
  end

  def valid_guess(guess)
    (guess >= GuessingGame::low_number) && (guess <= GuessingGame::high_number)
  end
end

class GuessingGame

  def initialize(low_end, high_end)
    @player = Player.new
    @@low_number = low_end
    @@high_number = high_end
    @range = (@@low_number..@@high_number)
    @guesses = Math.log2(@range.size).to_i + 1
  end

  def self.high_number
    @@high_number
  end

  def self.low_number
    @@low_number
  end

  def play
    number = (@range).to_a.sample
    number_of_guesses = @guesses
    guess = nil
    number_of_guesses.times do
      display_number_of_guesses(number_of_guesses)
      guess = @player.guess_number
      break if guess == number
      guess > number ? display_higher_guess : display_lower_guess
      number_of_guesses -= 1
    end
    guess == number ? display_win : display_lose
  end

  def display_number_of_guesses(number_of_guesses)
    if number_of_guesses == 1
      puts "You have #{number_of_guesses} guess remaining."
    else
      puts "You have #{number_of_guesses} guesses remaining."
    end
  end

  def display_higher_guess
    puts "Your guess was too high."
    puts ""
  end

  def display_lower_guess
    puts "Your guess was too low."
    puts ""
  end

  def display_win
    puts "You win!"
    puts ""
  end

  def display_lose
    puts "You ran out of guesses. You lose!"
    puts ""
  end
end

game = GuessingGame.new(1000, 10000)
game.play
