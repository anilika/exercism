class Phrase
  attr_reader :phrase
  
  def initialize(phrase)
    @phrase = phrase.downcase
  end
  
  def word_count
    count = Hash.new(0)
    phrase.gsub(/(?!'\w)\W+/, ' ').split.each { |word| count[word] += 1 }
    count
  end
end
