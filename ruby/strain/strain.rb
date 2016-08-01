class Array
  def discard
    self.each_with_object([]) { |x, result| result.push(x) unless yield(x) }
  end

  def keep
    self.each_with_object([]) { |x, result| result.push(x) if yield(x) }
  end
end
