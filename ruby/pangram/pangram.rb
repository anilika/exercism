class Pangram
  def self.is_pangram?(text)
    return false if text.empty?
    abc = ('a'..'z').to_a
    text.each_char do |word|
      abc.delete(word.downcase)
    end
    abc.empty?
  end
end
