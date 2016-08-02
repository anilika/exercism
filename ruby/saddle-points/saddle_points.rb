class Matrix
  def initialize(matrix_str)
    @matrix_str = matrix_str
  end

  def rows
    @matrix_str.each_line.map do |line|
      line.chomp.split.map(&:to_i)
    end
  end

  def columns
    rows.transpose
  end

  def saddle_points
    columns.map(&:min).each_with_object([]) do |num, points|
      rows.each_with_index do |row, index|
        points.push([index, row.index(num)]) if row.max == num
      end
    end
  end
end
