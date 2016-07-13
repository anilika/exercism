module ETL
  def self.transform(old_data)
    new_data = {}
    old_data.each do |score, letters|
      letters.each { |letter| new_data[letter.downcase] = score }
    end
    new_data
  end
end
