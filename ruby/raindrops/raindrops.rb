module Raindrops  
  FACTORS = { 'Pling' => 3, 'Plang' => 5, 'Plong' => 7 }.freeze
  
  def self.convert(num)
    result = FACTORS.select { |key, value| num % value == 0 }.keys.join
    result.empty? ? num.to_s : result.to_s
  end
end
