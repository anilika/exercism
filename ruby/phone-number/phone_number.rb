class PhoneNumber
  ZEROS = '0000000000'.freeze
  SIZE_CODE = 3
  TEMPLATE = '(XXX) XXX-XXXX'.freeze

  attr_reader :number

  def initialize(number)
    @number = normalise(number)
  end

  def area_code
    number.slice(0, SIZE_CODE)
  end

  def to_s
    string_number = TEMPLATE.dup
    number.each_char { |num| string_number.sub!(/X/, num) }
    string_number
  end

  private

  def normalise(number)
    number.gsub!(/\W/, '')
    return ZEROS unless number.scan(/[^0-9]/).empty?
    return number if number.size == 10
    return number[1..-1] if number.size == 11 && number.start_with?('1')
    ZEROS
  end
end
