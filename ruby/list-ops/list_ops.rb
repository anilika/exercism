class ListOps
  class << self
    def arrays(array)
      length = 0
      until array.empty?
        array.shift
        length += 1
      end
      length
    end

    def reverser(array)
      inverted_array = []
      inverted_array.push(array.pop) until array.empty?
      inverted_array
    end

    def concatter(fist_array, second_array)
      fist_array.push(second_array).flatten
    end

    def mapper(array)
      array.shift
      array[-1] += 1 if array[-1]
    end

    def filterer(array)
      filtered_array = []
      while array.any?
        element = array.shift
        filtered_array.push(element) if element.even?
      end
      filtered_array
    end

    def sum_reducer(array)
      sum = 0
      sum += array.shift until array.empty?
      sum
    end

    def factorial_reducer(array)
      factorial = 1
      factorial *= array.shift until array.empty?
      factorial
    end
  end
end
