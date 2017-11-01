# make a hash table for the suits and faces where the key is the element of the
# constant and the value is the english word (e.g. ['C', 'K'] would be
# {'C' => 'Clubs', 'K' => 'King'}). This will allow changing the line that
# puts the player's and dealer's hand so that it reads in english instead of 
# displaying an array.

SUITS = %w[C D S H]
FACES = %w[2 3 4 5 6 7 8 9 10 J Q K A]

def initialize_deck
  deck = []
  SUITS.each do |suit|
    FACES.each do |face|
      deck << [suit, face]
    end
  end

  deck
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def deal(deck)
  player_hand = []
  dealer_hand = []
  player_hand << deck.sample
  deck.delete(player_hand[0])
  player_hand << deck.sample
  deck.delete(player_hand[1])
  dealer_hand << deck.sample
  deck.delete(dealer_hand[0])
  dealer_hand << deck.sample
  deck.delete(dealer_hand[1])

  return player_hand, dealer_hand
end

def hit(deck)
  new_card = deck.sample
  deck.delete(new_card)
  new_card
end

def busted?(hand)
  total(hand) > 21
end

def who_won?(player_hand, dealer_hand)
  if total(player_hand) > total(dealer_hand)
    "player"
  else
    "dealer"
  end
end

def display_winner(winner)
  if winner == 'player'
    puts "You won!"
  else
    puts "The dealer won!"
  end
end

loop do # main loop
  loop do # game start
    deck = initialize_deck
    player_hand, dealer_hand = deal(deck)

    puts "Your hand is #{player_hand} with a total of #{total(player_hand)}."
    puts "Dealer's hand is #{dealer_hand[0]} and one hidden card."

    # player_turn
    answer = nil
    loop do
      loop do
        puts "hit or stay?"
        answer = gets.chomp.downcase
        break if answer == 'hit' || answer == 'stay'
        puts "please answer 'hit' or 'stay'"
      end
      if answer == 'hit'
        player_hand << hit(deck)
        puts "You were dealt #{player_hand.last}."
        puts "Your hand total is #{total(player_hand)}."
      end
      break if answer == 'stay' || busted?(player_hand)
    end

    if busted?(player_hand)
      puts "Bust! You LOST!"
      break
    else
      puts "You chose to stay!"
    end

    # dealer_turn
    answer = nil
    loop do
      break if total(dealer_hand) >= 17 || busted?(dealer_hand)
      dealer_hand << hit(deck)
    end

    if busted?(dealer_hand)
      puts "The dealer busted! You WON!"
      break
    else
      puts "Dealer chose to stay!"
    end

    # calculate who won
    winner = who_won?(player_hand, dealer_hand)

    # declare the winner
    puts "You have #{total(player_hand)}."
    puts "The dealer has #{total(dealer_hand)}."
    display_winner(winner)
    break
  end

  # play again?
  answer = nil
  loop do
    puts "Would you like to play again? (y/n)"
    answer = gets.chomp.downcase[0]
    break if answer == 'y' || answer == 'n'
    puts "That was an invalid choice."
  end
  break if answer == 'n'
end

puts "Thanks for playing!"
