class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(first_bucket, second_bucket, litres, goal_bucket)
    @first_bucket, @second_bucket = Bucket.new(first_bucket), Bucket.new(second_bucket)
    @first_bucket, @second_bucket = @second_bucket, @first_bucket if goal_bucket == 'two'
    @litres, @goal_bucket, @moves, @other_bucket = litres, goal_bucket, 0, calculate
  end

  def calculate
    until @first_bucket.content == @litres
      @second_bucket.drain if @second_bucket.full?
      @first_bucket.fill_in if @first_bucket.empty?
      rest = @second_bucket.fill_in(@first_bucket.content)
      @first_bucket.drain
      @first_bucket.fill_in(rest)
      @moves += 2
    end
    @second_bucket.content
  end
end

class Bucket
  include Comparable
  attr_reader :size, :content

  def initialize(size, content = 0)
    @size = size
    @content = content
  end

  def fill_in(litres = @size)
    rest = 0
    if @content + litres > @size
      rest = @content + litres - @size
      @content = @size
    else
      @content += litres
    end
    rest
  end

  def drain
    @content = 0
  end

  def empty?
    @content.zero?
  end

  def full?
    @content == @size
  end

  def <=>(other)
    @size <=> other.size
  end
end
