module Acronym
  def self.abbreviate(phrase)
    underscore(phrase).tr('_', ' ').split(' ')
      .map { |word| word.chr.upcase }.join
  end

  def self.underscore(camel_cased_word)
    camel_cased_word.gsub(/::/, '/')
      .gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
      .gsub(/([a-z\d])([A-Z])/,'\1_\2')
      .tr('-', '_').downcase
  end
end
