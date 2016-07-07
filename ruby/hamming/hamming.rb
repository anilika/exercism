class Hamming
  def self.compute(first_dna, second_dna)
    result = 0
    return result if first_dna == second_dna
    raise ArgumentError unless first_dna.size == second_dna.size
    (0...first_dna.size).each do |char|
      result += 1 unless first_dna[char] == second_dna[char]
    end
    result
  end
end
