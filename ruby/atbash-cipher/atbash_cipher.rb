module Atbash
  ABC = ('a'..'z').to_a
  REVERSED_ABC = ABC.reverse

  def self.encode(phrase)
    phrase.downcase.scan(/[a-z0-9]/).map do |char|
      ABC.include?(char) ? REVERSED_ABC[ABC.index(char)] : char
    end.each_slice(5).map(&:join).join(' ')
  end
end
