class Nucleotide
  NUCLEOTIDES = %w(A C G T).freeze

  def self.from_dna(dna)
    new(dna)
  end

  attr_reader :histogram

  def initialize(dna)
    check_dna(dna)
    @histogram = compute_nucleotides(dna)
  end

  def count(nucleotide)
    histogram[nucleotide]
  end

  private

  def check_dna(dna)
    raise ArgumentError unless dna.scan(/[^ACGT]/).empty?
  end

  def compute_nucleotides(dna)
    result = {}
    NUCLEOTIDES.each do |nucleotide|
      result[nucleotide] = dna.scan(nucleotide).size
    end
    result
  end
end
