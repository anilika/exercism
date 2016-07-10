class Array
  def accumulate
    result = []
    self.each { |x| result.push(yield(x)) }
    result
  end
end