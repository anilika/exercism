module RailFenceCipher
  def self.encode(phrase, rail)
    placed_chars(create_rail(phrase.size, rail), phrase).transpose.join
  end

  def self.decode(phrase, rail)
    placed_chars(create_rail(phrase.size, rail).transpose, phrase).transpose.join
  end

  def self.create_rail(length, width)
    rail = Array.new(length) { Array.new(width) }
    place, route = 0, true
    0.upto(length - 1).each do |level|
      rail[level][place] = true
      if route
        place == width - 1 ? route = false : place += 1
        place -= 1 unless route
      else
        place <= 0 ? route = true : place -= 1
        place += 1 if route
      end
    end
    rail
  end

  def self.placed_chars(rail, phrase)
    level = 0
    phrase.each_char do |char|
      level += 1 unless rail[level].index(true)
      rail[level][rail[level].index(true)] = char
    end
    rail
  end

  private_class_method :create_rail, :placed_chars
end
