class Complement
  REPL_NUCLEO = {G:'C', C: 'G', T: 'A', A: 'U'}.freeze
  
  def self.of_dna(rna)
    rna.split(//).map! do |nucleo|
      return '' unless REPL_NUCLEO.include? nucleo.to_sym
      REPL_NUCLEO[nucleo.to_sym]
    end.join
  end
end
