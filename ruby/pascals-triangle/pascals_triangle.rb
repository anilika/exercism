class Triangle
  def initialize(num_rows)
    @num_rows = num_rows
  end

  def rows
    rows = Array.new(@num_rows) { [] }
    rows.each_with_index do |row, index|
      row.push(1)
      row.push(calculate_row(rows[index - 1])) if rows[index - 1].any?
      row.push(1) unless index.zero?
      rows[index] = row.flatten
    end
    rows
  end

  private

  def calculate_row(previous_row)
    previous_row.each_cons(2).map { |pair| pair.inject(:+) }
  end
end
