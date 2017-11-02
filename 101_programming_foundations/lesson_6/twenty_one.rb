SUITS = %w[C D S H]
FACES = %w[2 3 4 5 6 7 8 9 10 J Q K A]
DEALER_STAY = 17
BUST_AT = 21
CONVERT_TO_ENGLISH = {
  'C' => 'Clubs', 'D' => 'Diamonds', 'S' => 'Spades', 'H' => 'Hearts',
  '2' => '2', '3' => '3', '4' => '4', '5' => '5', '6' => '6', '7' => '7',
  '8' => '8', '9' => '9', '10' => '10', 'J' => 'Jack', 'Q' => 'Queen',
  'K' => 'King', 'A' => 'Ace'
}

def initialize_deck
  deck = []
  SUITS.each do |suit|
    FACES.each do |face|
      deck << [suit, face]
    end
  end

  deck
end

# rubocop:disable Style/ConditionalAssignment
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
# rubocop:enable Style/ConditionalAssignment

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
  total(hand) > BUST_AT
end

def who_won?(player_hand, dealer_hand)
  if total(player_hand) > total(dealer_hand)
    "player"
  elsif total(dealer_hand) > total(player_hand)
    "dealer"
  else
    "tie"
  end
end

def display_winner(winner)
  if winner == 'player'
    puts "You won!"
  elsif winner == 'dealer'
    puts "The dealer won!"
  else
    puts "It was a tie!"
  end
end

def hand_in_english(hand)
  # [['S', '2'], ['D', '3'], ['C', 'K']] is
  # "2 of Spades, 3 of Diamonds, and King of Clubs"
  start = ''
  finish = ''
  hand.each do |card|
    if hand.last == card
      finish = "and #{CONVERT_TO_ENGLISH[card[1]]} of \
#{CONVERT_TO_ENGLISH[card[0]]}"
    else
      start.concat("#{CONVERT_TO_ENGLISH[card[1]]} of \
#{CONVERT_TO_ENGLISH[card[0]]}, ")
    end
  end
  start.concat(finish)
end

def declare_final_totals(player_hand, dealer_hand)
  puts "\nYou have: #{hand_in_english(player_hand)} for a total of \
#{total(player_hand)}."
  puts "The dealer has: #{hand_in_english(dealer_hand)} for a total of \
#{total(dealer_hand)}."
end

loop do # main loop
  loop do # game start
    deck = initialize_deck
    player_hand, dealer_hand = deal(deck)

    puts "Your hand is: #{hand_in_english(player_hand)} for a total \
of #{total(player_hand)}."
    puts "Dealer's hand is: #{CONVERT_TO_ENGLISH[dealer_hand[0][1]]} of \
#{CONVERT_TO_ENGLISH[dealer_hand[0][0]]} and one hidden card."

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
        puts "\nYou were dealt: #{CONVERT_TO_ENGLISH[player_hand.last[1]]} of \
#{CONVERT_TO_ENGLISH[player_hand.last[0]]}."
        puts "Your hand total is #{total(player_hand)}."
      end

      break if answer == 'stay' || busted?(player_hand)
    end

    if busted?(player_hand)
      puts "\nBust! You LOST!"
      declare_final_totals(player_hand, dealer_hand)
      break
    else
      puts "\nYou chose to stay!"
    end

    # dealer_turn
    answer = nil
    loop do
      break if total(dealer_hand) >= DEALER_STAY || busted?(dealer_hand)
      dealer_hand << hit(deck)
    end

    if busted?(dealer_hand)
      puts "\nThe dealer busted! You WON!"
      declare_final_totals(player_hand, dealer_hand)
      break
    else
      puts "\nDealer chose to stay!"
    end

    # calculate who won
    winner = who_won?(player_hand, dealer_hand)

    # declare the winner
    declare_final_totals(player_hand, dealer_hand)
    display_winner(winner)
    break
  end

  # play again?
  answer = nil
  loop do
    puts "\nWould you like to play again? (y/n)"
    answer = gets.chomp.downcase[0]
    break if answer == 'y' || answer == 'n'
    puts "That was an invalid choice."
  end
  system 'clear'
  break if answer == 'n'
end

puts "Thanks for playing!"
