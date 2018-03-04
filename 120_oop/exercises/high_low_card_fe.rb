class Card
  attr_reader :rank, :suit

  SUITS = { 'Diamonds' => 1, 'Spades' => 4, 'Hearts' => 3, 'Clubs' => 2 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other_card)
    if rank_value < other_card.rank_value
      -1
    elsif rank_value > other_card.rank_value
      1
    else
      suit_value <=> other_card.suit_value
    end
  end

  def suit_value
    SUITS.fetch(@suit)
  end

  def rank_value
    case @rank
    when 'Ace' then 14
    when 'King' then 13
    when 'Queen' then 12
    when 'Jack' then 11
    else @rank.to_i
    end
  end

  def to_s
    "#{@rank} of #{@suit}"
  end

  def ==(other_card)
    self.to_s == other_card.to_s
  end
end

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
        Card.new(4, 'Diamonds'),
        Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
        Card.new('Jack', 'Diamonds'),
        Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max

cards = [Card.new(8, 'Diamonds'),
        Card.new(8, 'Clubs'),
        Card.new(8, 'Spades')]
puts cards.min
puts cards.max
