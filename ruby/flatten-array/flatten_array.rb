module FlattenArray
  def self.flatten(array)
    result = []
    array.each do |element|
      if element.is_a?(Array)
        result += flatten(element)
      else
        result.push(element) unless element.nil?
      end
    end
    result
  end
end
