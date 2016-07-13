class Array
  def discard
    result = []
    self.each { |x| result.push(x) unless yield(x) }
    result
  end

  def keep
    result = []
    self.each { |x| result.push(x) if yield(x) }
    result
  end
end
