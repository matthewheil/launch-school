require 'pry'

module Messageable
  def msg(message)
    puts message.to_s
    puts ""
  end

  def clear
    system 'clear'
  end
end

module Hand
  include Messageable

  BUST_AT = 21
  LOW_ACE = 1
  HIGH_ACE = 11
  FACE_CARD = 10

  def hit(deck)
    deck.deal_one(self)
  end

  def busted?
    total > BUST_AT
  end

  def calculate_value(card_face)
    if card_face == "A" # card is an ace
      total < HIGH_ACE ? HIGH_ACE : LOW_ACE
    elsif card_face.to_i == 0 # J, Q, K
      FACE_CARD
    else
      card_face.to_i
    end
  end

  def increment_total
    card_face = hand.last.value[1] # last dealt card's value (1-10 or J-A)
    self.total += calculate_value(card_face)
    correct_for_aces if card_face == 'A'
  end

  def correct_for_aces
    hand.select(&:ace?).count.times do
      break if total <= 21
      self.total -= 10
    end
  end
end

class Participant
  include Messageable
  include Hand

  attr_reader :name
  attr_accessor :total, :hand

  def initialize(name='Dealer')
    @name = name
    @hand = []
    @total = 0
  end

  def display_hand_total
    msg "#{name}'s total is:\n\t#{total}"
  end

  def display_hit_message
    clear
    msg "#{name} chose to hit and was dealt:\n\t#{hand.last}"
    display_hand_total unless self.class == Dealer
  end

  def display_bust_message
    clear
    display_hand
    msg "#{name} BUSTED!!!"
  end

  def display_hand
    msg "#{name}'s hand is worth #{total}:\n\t"\
        "#{hand.join(', ')}"
  end

  def display_stay_message
    clear
    display_hand_total unless self.class == Dealer
    msg "#{name} chose to stay!"
  end

  def to_s
    @name
  end
end

class Player < Participant
  attr_reader :choice

  def initialize
    @name = set_name
    super(name)
    @choice = ''
  end

  def set_name
    clear
    name = ''
    loop do
      msg "Please enter your name: "
      name = gets.chomp.to_s.split.map(&:capitalize).join(' ')
      break unless name.empty?
    end
    name
  end

  def hit_or_stay?
    puts "Do you want to hit or stay?"
    loop do
      @choice = gets.chomp.downcase
      break if @choice == 'hit' || @choice == 'stay'
      puts "Please answer 'hit' or 'stay'"
    end
  end
end

class Dealer < Participant
  DEALER_STAY = 17

  def hit_or_stay?
    total >= DEALER_STAY ? 'stay' : 'hit'
  end
end

class Deck
  SUITS = %w[C D S H]
  FACES = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  NUMBER_OF_DECKS = 6

  def initialize
    @deck = []
    NUMBER_OF_DECKS.times do
      SUITS.each do |suit|
        FACES.each do |face|
          @deck << Card.new([suit, face])
        end
      end
    end
  end

  def initial_deal(player, dealer)
    [player, dealer].each { |participant| 2.times { deal_one(participant) } }
  end

  def deal_one(participant)
    participant.hand << @deck.sample
    @deck.delete(participant.hand.last)
    participant.increment_total
  end

  def size
    @deck.size
  end

  def to_s
    @deck
  end
end

class Card
  CONVERT_TO_ENGLISH = {
    'C' => 'Clubs', 'D' => 'Diamonds', 'S' => 'Spades', 'H' => 'Hearts',
    '2' => '2', '3' => '3', '4' => '4', '5' => '5', '6' => '6', '7' => '7',
    '8' => '8', '9' => '9', '10' => '10', 'J' => 'Jack', 'Q' => 'Queen',
    'K' => 'King', 'A' => 'Ace'
  }

  attr_reader :value

  def initialize(suit_and_face_array)
    @value = suit_and_face_array
  end

  def ace?
    @value[1] == 'A'
  end

  def to_s
    "#{CONVERT_TO_ENGLISH[@value[1]]} of #{CONVERT_TO_ENGLISH[@value[0]]}"
  end
end

class Game
  include Messageable

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    display_welcome_message
    loop do
      1.times do
        deal_initial_cards
        show_initial_cards
        player_turn
        break if @player.busted?
        dealer_turn
        break if @dealer.busted?
        show_result
      end

      break unless play_again?
      reset
    end

    display_goodbye_message
  end

  def display_welcome_message
    clear
    msg "Welcome to black jack, #{@player.name}!"
  end

  def display_goodbye_message
    clear
    msg "Thanks for playing black jack, #{@player.name}! Goodbye."
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

  def reset
    @player.total = 0
    @dealer.total = 0
    @player.hand = []
    @dealer.hand = []
    @deck = Deck.new if @deck.size < 52
    clear
  end

  def deal_initial_cards
    msg "The cards have been dealt."
    @deck.initial_deal(@player, @dealer)
  end

  def show_initial_cards
    msg "Your hand:\n\t#{@player.hand[0]}\n\t#{@player.hand[1]}"
    msg "Dealer's hand:\n\t#{@dealer.hand[0]}\n\tHidden card"
  end

  def player_turn
    msg "Your card total is #{@player.total}."
    loop do
      @player.hit_or_stay?
      clear
      @player.hit(@deck) if @player.choice == 'hit'
      break if @player.choice == 'stay' || @player.busted?
      @player.display_hand
    end

    if @player.busted?
      @player.display_bust_message
    else
      @player.display_stay_message
    end
  end

  def dealer_turn
    loop do
      break if @dealer.total >= 17
      @dealer.hit(@deck)
      @dealer.display_hand
    end

    if @dealer.busted?
      @dealer.display_bust_message
    else
      @dealer.display_stay_message
    end
  end

  def show_result
    @player.display_hand
    msg "#{@dealer.name}'s hand is worth #{@dealer.total}:\n\t"\
        "#{@dealer.hand.join(', ')}"
    case @dealer.total <=> @player.total
    when 1 then msg "#{@dealer.name} won!"
    when 0 then msg "It's a tie!"
    when -1 then msg "#{@player.name} won!"
    end
  end
end

Game.new.start
