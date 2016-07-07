class String
  def subst(word, other_word)
    self.gsub(Regexp.new('\{\{' + word + '\}\}'), other_word.to_s)
  end
end

class FoodChain
  attr_accessor :song
  #
  ANIMALS = [:fly, :spider, :bird, :cat, :dog, :goat, :cow, :horse]
  #ANIMALS = ['fly', 'spider', 'bird', 'cat', 'dog', 'goat', 'cow', 'horse']
  #FIRST_STRING = "I know an old lady who swallowed a {{animal}}.\n"
  #ANIMALS_STRING = {fly: "I don't know why she swallowed the fly.",
  #                  spider: "It wriggled and jiggled and tickled inside her.\n",
  #                  bird: "How absurd to swallow a bird!\n",
  #                  cat: "Imagine that, to swallow a cat!\n",
  #                  dog: "What a hog, to swallow a dog!\n",
  #                  goat: "Just opened her throat and swallowed a goat!\n",
  #                  cow: "I don't know how she swallowed a cow!\n",
  #                  horse: "She's dead, of course!\n"}
  #THIRD_STRING = "She swallowed the {{animal}} to catch the {{prior_animal}}.\n"
  #END_PHRASE = "Perhaps she'll die.\n\n"
  SUBSTITUTES = {first: 'animal', third: ['animal', 'prior_animal']}
  
  STRINGS = { first: "I know an old lady who swallowed a {{animal}}.\n",
              second: { fly: "I don't know why she swallowed the fly.",
                        spider: "It wriggled and jiggled and tickled inside her.\n",
                        bird: "How absurd to swallow a bird!\n",
                        cat: "Imagine that, to swallow a cat!\n",
                        dog: "What a hog, to swallow a dog!\n",
                        goat: "Just opened her throat and swallowed a goat!\n",
                        cow: "I don't know how she swallowed a cow!\n",
                        horse: "She's dead, of course!\n" },
              third: "She swallowed the {{animal}} to catch the {{prior_animal}}.\n",
              end_phrase: "Perhaps she'll die.\n\n" }
  
  def self.songadsad
    my_song = new
    my_song.create
    my_song.song.join
  end
  
  def initialize
    @song = [[], [], [], [], [], [], [], []]
  end
  
  def self.song
    song = [[], [], [], [], [], [], [], []]
    ANIMALS.each_with_index do |animal, index|
      song[index] << first_string(animal)
      song[index] << second_string(index, animal)
      song[index] << third_string(index, animal)
      print last_strings(index, song)
      song[index] << last_strings(index, song)
      song[index].flatten!
      song[index].compact!
    end
    song.join
  end
  
  def string_new(number, index, animal)
    #case index
    #when test
  end
  
  def self.first_string(animal)
    STRINGS[:first].subst(SUBSTITUTES[:first], animal)
  end
  
  def self.second_string(index, animal)
    result = index == 0 ? ' ' + STRINGS[:end_phrase] : ''
    result[0,0] = STRINGS[:second][animal]
    result
  end
  
  def self.third_string(index, animal)
    if index == 2
      STRINGS[:third].subst(SUBSTITUTES[:third][0], animal)
      .subst(SUBSTITUTES[:third][1], ANIMALS[index-1])[0..-3] + ' ' +
      'that' + STRINGS[:second][ANIMALS[index-1]][2..-1]
    elsif index == 1 || (3..6).include?(index)
      STRINGS[:third].subst(SUBSTITUTES[:third][0], animal).
      subst(SUBSTITUTES[:third][1], ANIMALS[index-1])
    end
  end
  
  def self.last_strings(index, song)
    song[index-1].last(index) if (1..6).include?(index)
  end
  
  private_class_method :first_string, :second_string, :third_string, :last_strings
  
  def create
    ANIMALS.each_with_index do |animal, index|
      add_first_string(index, animal)
      add_second_strind(index, animal)
      add_third_string(index, animal)
      add_last_strings(index)
      song[index].flatten!
    end
  end
  
  def add_first_string(index, animal)
    song[index] << FIRST_STRING.substitute(SUBSTITUTES[:first], animal)
    
  end
  
  def add_second_strind(index, animal)
    if index == 0
      song[index] << ANIMALS_STRING[animal.to_sym] + ' ' + END_PHRASE
    else
      song[index] << ANIMALS_STRING[animal.to_sym]
    end
  end
  
  def add_third_string(index, animal)
    if index == 2
      song[index] << THIRD_STRING.substitute(SUBSTITUTES[:third][0], animal).
      substitute(SUBSTITUTES[:third][1], ANIMALS[index-1])[0..-3] + ' ' +
      'that' + ANIMALS_STRING[ANIMALS[index-1].to_sym][2..-1]
    elsif index == 1 || (3..6).include?(index)
      song[index] << THIRD_STRING.substitute(SUBSTITUTES[:third][0], animal).
      substitute(SUBSTITUTES[:third][1], ANIMALS[index-1])
    end
  end
  
  def add_last_strings(index)
    song[index] << song[index-1].last(index) if (1..6).include?(index)
  end
end

print FoodChain.song