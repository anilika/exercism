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
end
