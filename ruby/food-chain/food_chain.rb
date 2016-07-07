class FoodChain

  ANIMALS = { fly: "I don't know why she swallowed the fly. Perhaps she'll die.\n\n",
              spider: "It wriggled and jiggled and tickled inside her.\n",
              bird: "How absurd to swallow a bird!\n",
              cat: "Imagine that, to swallow a cat!\n",
              dog: "What a hog, to swallow a dog!\n",
              goat: "Just opened her throat and swallowed a goat!\n",
              cow: "I don't know how she swallowed a cow!\n",
              horse: "She's dead, of course!\n" }.freeze
  STRINGS = { first: "I know an old lady who swallowed a {{animal}}.\n",
              second: '{{phrase}}',
              third: "She swallowed the {{animal}} to catch the {{prior_animal}}.\n" }.freeze

  def self.song
    result = [[], [], [], [], [], [], [], []]
    ANIMALS.keys.each_with_index do |animal, index|
      result[index] << first_line(animal)
      result[index] << second_line(animal)
      case index
      when (1..6)
        result[index] << third_line(animal, index)
        result[index] << result[index - 1].last(index)
      end
      result[index].flatten!
    end
    result.join
  end

  def self.first_line(animal)
    subst(:first, animal: animal)
  end

  def self.second_line(animal)
    subst(:second, phrase: ANIMALS[animal])
  end

  def self.third_line(animal, index)
    prior_animal = ANIMALS.keys[index - 1]
    line = subst(:third, animal: animal, prior_animal: prior_animal)
    line.chomp!.chop! << ANIMALS[prior_animal].sub('It', ' that') if animal == :bird
    line
  end

  def self.subst(key, values)
    return nil unless STRINGS.key?(key)
    line = STRINGS[key]
    values.each do |k, v|
      return nil if v.nil?
      line = line.gsub(Regexp.new('\{\{' + k.to_s + '\}\}'), v.to_s)
    end
    line
  end

  private_class_method :first_line, :second_line, :third_line, :subst
end
