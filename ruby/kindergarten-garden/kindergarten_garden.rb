class Garden
  STUDENTS = %w(Alice Bob Charlie David
                Eve Fred Ginny Harriet
                Ileana Joseph Kincaid Larry).freeze
  PLANTS = { 'G' => :grass, 'C' => :clover,
             'R' => :radishes, 'V' => :violets }.freeze

  def initialize(diagram, students = STUDENTS)
    format(diagram).zip(students.sort.map(&:downcase)).each do |plants, student|
      instance_variable_set('@' + student, full_name(plants))
      self.class.class_eval { attr_reader student }
    end
  end

  private

  def format(diagram)
    diagram.split.map do |sill|
      sill.split(/(..)/).reject(&:empty?)
    end.transpose.map(&:join)
  end

  def full_name(plants)
    plants.chars.map do |plant|
      PLANTS[plant]
    end
  end
end
