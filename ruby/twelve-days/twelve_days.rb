class TwelveDays
  GIFTS = ['a Partridge in a Pear Tree',
           'two Turtle Doves, and',
           'three French Hens,',
           'four Calling Birds,',
           'five Gold Rings,',
           'six Geese-a-Laying,',
           'seven Swans-a-Swimming,',
           'eight Maids-a-Milking,',
           'nine Ladies Dancing,',
           'ten Lords-a-Leaping,',
           'eleven Pipers Piping,',
           'twelve Drummers Drumming,'].freeze
  DAYS = %w(first second third fourth fifth sixth
            seventh eighth ninth tenth eleventh twelfth)

  def self.song
    0.upto(GIFTS.size - 1).map do |day|
      num, gifts = DAYS[day], GIFTS[0..day].reverse.join(' ')
      "On the #{num} day of Christmas my true love gave to me, #{gifts}.\n"
    end.join("\n")
  end
end
