module Brackets
  BRACKETS = { '(' => ')', '[' => ']', '{' => '}' }.freeze

  def self.paired?(string)
    string.gsub(/[^({\[)}\]]/, '').chars.each_with_object([]) do |bracket, store|
      if BRACKETS[bracket]
        store.push(bracket)
      else
        return false unless BRACKETS[store.last] == bracket
        store.pop
      end
    end.empty?
  end
end
