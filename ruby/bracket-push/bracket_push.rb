module Brackets
  BRACKETS = [['(', ')'], ['[', ']'], ['{', '}']].freeze
  OPEN_BRACKETS = ['(', '[', '{'].freeze

  def self.paired?(brackets)
    result = []
    brackets.gsub(/[^({\[)}\]]/, '').each_char do |bracket|
      if OPEN_BRACKETS.include?(bracket)
        result.push(bracket)
      else
        BRACKETS.include?([result.last, bracket]) ? result.pop : result.push(bracket)
      end
    end
    result.empty?
  end
end
