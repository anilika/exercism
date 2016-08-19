class InvalidCodonError < StandardError
end

module Translation
  TRANSCRIPTION = { 'AUG' => :Methionine,
                    'UUU' => :Phenylalanine, 'UUC' => :Phenylalanine,
                    'UUA' => :Leucine, 'UUG' => :Leucine,
                    'UCU' => :Serine, 'UCC' => :Serine, 'UCA' => :Serine, 'UCG' => :Serine,
                    'UAU' => :Tyrosine, 'UAC' => :Tyrosine,
                    'UGU' => :Cysteine, 'UGC' => :Cysteine,
                    'UGG' => :Tryptophan,
                    'UAA' => :STOP, 'UAG' => :STOP, 'UGA' => :STOP }.freeze

  def self.of_codon(codon)
    raise InvalidCodonError unless codon.scan(/[^UAGC]/).empty?
    TRANSCRIPTION[codon].to_s
  end

  def self.of_rna(rna)
    rna.chars.each_slice(3).map(&:join).each_with_object([]) do |codon, result|
      protein = of_codon(codon)
      return result if protein == 'STOP'
      result.push(protein) unless result.include?(protein)
    end
  end
end
