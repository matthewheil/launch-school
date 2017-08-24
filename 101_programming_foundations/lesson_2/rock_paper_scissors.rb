require 'pry'

VALID_CHOICES = %w(rock paper scissors lizard Spock)

WINNING_CONDITIONS = [%w(rock scissors), %w(paper rock), %w(scissors paper),
                      %w(rock lizard), %w(lizard Spock), %w(Spock scissors),
                      %w(scissors lizard), %w(lizard paper), %w(paper Spock),
                      %w(Spock rock)]

def convert_choice!(choice)
  case choice
  when 'r' then choice.replace 'rock'
  when 'p' then choice.replace 'paper'
  when 's' then choice.replace 'scissors'
  when 'l' then choice.replace 'lizard'
  when 'S' then choice.replace 'Spock'
  end
end

def win?(winner, loser)
  won = false
  WINNING_CONDITIONS.each do |threw|
    won = true if winner == threw[0] && loser == threw[1]
  end
  won
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

loop do
  player_wins = 0
  computer_wins = 0

  loop do
    choice = ''

    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = gets.chomp
      convert_choice!(choice)
      break if VALID_CHOICES.include?(choice)
      prompt("That's an invalid choice.")
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose #{choice}. Computer chose #{computer_choice}.")

    prompt(display_result(choice, computer_choice))

    if who_won?(choice, computer_choice) == 'player'
      player_wins += 1
    elsif who_won?(choice, computer_choice) == 'computer'
      computer_wins += 1
    end

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
end
