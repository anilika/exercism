module RailFenceCipher
  def self.encode(phrase, rail)
    result = Array.new(phrase.size) { Array.new(rail) }
    place, route = 0, true
    phrase.chars.each_with_index do |char, index|
      result[index][place] = char
      if route
        place == rail - 1 ? route = false : place += 1
        place -= 1 unless route
      else
        place <= 0 ? route = true : place -= 1
        place += 1 if route
      end
    end
    result.transpose.join
  end

  def self.decode(phrase, rail)
    result = Array.new(phrase.size) { Array.new(rail) }
    place, route = 0, true
    (0...phrase.size).each do |index|
      result[index][place] = true
      if route
        place == rail - 1 ? route = false : place += 1
        place -= 1 unless route
      else
        place <= 0 ? route = true : place -= 1
        place += 1 if route
      end
    end
    result = result.transpose
    level = 0
    phrase.each_char do |char|
      level += 1 unless result[level].index(true)
      result[level][result[level].index(true)] = char
    end
    result.transpose.join
  end
end
