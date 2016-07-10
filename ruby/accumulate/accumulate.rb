class Array
  def accumulate
    result = []
    self.each do |x|
      result.push(yield(x))
    end
    result
  end
end