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
                    ' _ |_| _|' => '9'}

  def initialize(text_num)
    @text_num = text_num
  end

  def convert
    @text_num.split("\n\n").map do |numbers|
      numbers.split("\n").map do |row|
        row =+ ' ' unless row.size % 3 == 0
        row = '   ' if row == ''
        row.chars.each_slice(3).to_a
      end.transpose.each_with_object('') do |num, result|
        dec_num = TRANSCRIPTION[num.join] ? (TRANSCRIPTION[num.join]) : '?'
        result << dec_num
      end
    end.join(',')
  end
end
