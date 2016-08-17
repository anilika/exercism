class Poker
  def initialize(*hands)
    @hands = hands
  end

  def best_hand

  end
end

class Hand
  CARDS = ['A', 'K', 'Q', 'J'] + 10.downto(2).to_a
  SUBST_CARD = { 'A' => 14, 'K' => 13, 'Q' => 12, 'J' => 11}


  def initialize(cards)
    @cards = Hash.new { |hsh, key| hsh[key] = []}
    cards.each do |card|
      @cards[card[-1]].push(card[0])
    end
  end

  def best_variant
    print @cards
    # if @cards.map(&:first).uniq.size == 1

    # end
  end
end

Hand.new(%w(4S 5H 5S 5D 5H)).best_variant
