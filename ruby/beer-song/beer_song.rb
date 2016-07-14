class BeerSong
  STRINGS = { first: "{{bottles}} bottle{{s}} of beer on the wall, {{bottles}} bottle{{s}} of beer.\n",
              second: "Take {{one}} down and pass it around, {{bottles}} bottle{{s}} of beer on the wall.\n",
              last: "Go to the store and buy some more, 99 bottles of beer on the wall.\n" }

  def initialize
    @song = create(99)
  end

  def verse(number)
    @song[number]
  end

  def verses(start_couplet, end_couplet)
    start_couplet.downto(end_couplet).map { |couplet| verse(couplet) + "\n" }.join.chomp
  end

  def lyrics
    @song.values.map { |couplet| couplet + "\n" }.join.chomp
  end

  private

  def create(number)
    song = {}
    song[number] = couplet_line(:first, number)
    (number - 1).downto(0).each do |bottle|
      song[bottle + 1].concat(couplet_line(:second, bottle))
      song[bottle] = couplet_line(:first, bottle)
    end
    song[0].concat(STRINGS[:last])
    song
  end

  def couplet_line(line, bottle, one = 'one')
    one = 'it' if line == :second && bottle == 0
    bottle = 'no more' if bottle == 0
    s = bottle == 1 ? '' : 's'
    subst(line, bottles: bottle, one: one, s: s).capitalize
  end

  def subst(key, values)
    return nil unless STRINGS.key?(key)
    line = STRINGS[key]
    values.each do |k, v|
      return nil if v.nil?
      line = line.gsub(Regexp.new('\{\{' + k.to_s + '\}\}'), v.to_s)
    end
    line
  end
end
