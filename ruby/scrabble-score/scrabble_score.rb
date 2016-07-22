class Scrabble
  LETTERS_VALUES = { %w(A E I O U L N R S T) => 1,
                    %w(D G) => 2,
                    %w(B C M P) => 3,
                    %w(F H V W Y) => 4,
                    %w(K) => 5,
                    %w(J X) => 8,
                    %w(Q Z) => 10 }.freeze

  def self.score(word)
    new(word).score
  end

  def initialize(word)
    @word = word
  end

  def score
    return 0 if @word.nil? || @word.scan(/[a-zA-Z]/).empty?
    @word.upcase.chars.map do |char|
      LETTERS_VALUES.select { |key| key.include?(char) }.values
    end.flatten.inject(:+)
  end
end
