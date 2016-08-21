module Diamond
  ABC = ('A'..'Z').to_a

  def self.make_diamond(letter)
    letter_number, middle = ABC.index(letter), 1
    diamond = [' ' * letter_number + 'A' + ' ' * letter_number + "\n"]
    1.upto(letter_number) do |index|
      middle_space, edge_space = ' ' * middle, ' ' * (letter_number - index)
      diamond.push(edge_space + ABC[index] + middle_space + ABC[index] + edge_space + "\n")
      diamond.push(diamond[0...-1].reverse).flatten! if ABC[index] == letter
      middle += 2
    end
    diamond.join
  end
end
