module FlattenArray
  def self.flatten(array)
    result = []
    array.each do |element|
      next if element.nil?
      result += element.is_a?(Array) ? flatten(element) : [element]
    end
    result
  end
end
