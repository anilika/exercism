class OCR
  TRANSCRIPTION = { ' _ | ||_|' => '0',
                    '     |  |' => '1',
                    ' _  _||_ ' => '2',
                    ' _  _| _|' => '3',
                    '   |_|  |' => '4',
                    ' _ |_  _|' => '5',
                    ' _ |_ |_|' => '6',
                    ' _   |  |' => '7',
                    ' _ |_||_|' => '8',
                    ' _ |_| _|' => '9' }.freeze

  def initialize(text_num)
    @text_num = text_num
  end

  def convert
    @text_num.split("\n\n").map do |numbers|
      collect_row(numbers).transpose.map do |num|
        TRANSCRIPTION[num.join] ? (TRANSCRIPTION[num.join]) : '?'
      end.join
    end.join(',')
  end

  def collect_row(numbers)
    rows = numbers.split("\n")
    row_size = rows.map(&:size).max
    rows.each_with_index.map do |row|
      row += ' ' * (row_size - row.size) unless row.size == row_size
      row.chars.each_slice(3).to_a
    end
  end
end
