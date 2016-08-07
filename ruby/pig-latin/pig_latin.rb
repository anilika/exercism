module PigLatin
  def self.translate(words)
    words.split.map do |word|
      if word.scan(/^[^aeoui]/).any? && word.scan(/^[yx][^auioe]/).empty?
          index_first_vowel = word.index(word.scan(/[aeoui]/).first)
          index_first_vowel += 1 if word[index_first_vowel - 1] == 'q'
          word = word[index_first_vowel..-1] + word[0...index_first_vowel]
      end
      word + 'ay'
    end.join(' ')
  end
end