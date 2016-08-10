class Allergies
  ALLERGENS = %w(eggs peanuts shellfish strawberries tomatoes
                chocolate pollen cats).freeze
  attr_reader :list

  def initialize(num)
    @list = num.to_s(2).reverse.chars.zip(ALLERGENS).map do |pair|
      pair.last if pair.first == '1'
    end.compact
  end

  def allergic_to?(allergen)
    @list.include?(allergen)
  end
end
