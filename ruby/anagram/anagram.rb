class String
  def sort
    self.downcase.chars.sort.join
  end
end

class Anagram
  def initialize(word)
    @check_word = word
  end

  def match(list)
    list.select do |word|
      word.sort.casecmp(@check_word.sort).zero? && word.casecmp(@check_word) != 0
    end.each_with_object([]) do |word, anagrams|
      anagrams << word unless anagrams.include?(word.downcase)
    end
  end
end
