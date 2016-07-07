class Bob
  def hey(msg)
    capital_l, lower_l = msg.scan(/[A-Z]/), msg.scan(/[a-z]/)
    numbers, last_sym = msg.scan(/[0-9]/), msg.gsub(/\n/, '').scan(/[\?!\.]$/)
    if (capital_l + lower_l + numbers + last_sym).empty?
      'Fine. Be that way!'
    elsif lower_l.empty? && capital_l.empty? == false
      'Whoa, chill out!'
    elsif last_sym.include?('?') && (lower_l || numbers)
      'Sure.'
    else
      'Whatever.'
    end
  end
end
