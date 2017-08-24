VALID_CHOICES = %w(rock paper scissors lizard spock)

WINNING_CONDITIONS = {  rock: %w(scissors lizard),
                        paper: %w(rock spock),
                        scissors: %w(paper lizard),
                        lizard: %w(spock paper),
                        spock: %w(scissors rock) }

def convert_choice!(player_abbreviated_choice)
  case player_abbreviated_choice
  when 'r'  then player_abbreviated_choice.replace 'rock'
  when 'p'  then player_abbreviated_choice.replace 'paper'
  when 'sc' then player_abbreviated_choice.replace 'scissors'
  when 'l'  then player_abbreviated_choice.replace 'lizard'
  when 'sp' then player_abbreviated_choice.replace 'Spock'
  end
end

def win?(winner_choice, loser_choice)
  WINNING_CONDITIONS[winner_choice.to_sym].include?(loser_choice)
end

def display_result(player, computer)
  if win?(player, computer)
    "You won!"
  elsif win?(computer, player)
    "You lost!"
  else
    "It was a tie!"
  end
end

def who_won?(player, computer)
  if win?(player, computer)
    'player'
  elsif win?(computer, player)
    'computer'
  end
end

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  (system('clear') || system('cls'))
end

welcome_message = <<-MSG
Welcome to Rock, Paper, Scissors, Lizard, Spock!
    The first one to win 5 games wins the match!
   ----------------------------------------------
MSG

loop do
  player_wins = 0
  computer_wins = 0

  prompt(welcome_message)

  loop do
    player_choice = ''

    loop do
      prompt("Choose one: rock (r), paper (p), scissors (sc), spock (sp):")
      player_choice = gets.chomp.downcase
      convert_choice!(player_choice)
      break if VALID_CHOICES.include?(player_choice)
      prompt("That's an invalid choice.")
    end

    computer_choice = VALID_CHOICES.sample

    if who_won?(player_choice, computer_choice) == 'player'
      player_wins += 1
    elsif who_won?(player_choice, computer_choice) == 'computer'
      computer_wins += 1
    end

    clear_screen

    prompt("You chose #{player_choice}. Computer chose #{computer_choice}.")
    prompt(display_result(player_choice, computer_choice))
    prompt("Your score: #{player_wins}")
    prompt("Computer's score: #{computer_wins}")

    if player_wins == 5
      prompt("You won the match!")
      break
    elsif computer_wins == 5
      prompt("The computer won the match!")
      break
    end
  end

  prompt("Would you like to play again? (y/n)")
  break if gets.chomp.downcase == 'n'

  clear_screen
end
