class School
  def initialize
    @students = []
  end

  def add(name, grade)
    @students.push(Student.new(name, grade))
  end

  def grade(num)
    @students.select { |student| student.grade == num }
             .map { |student| student.name }.sort
  end

  def students_by_grade
    @students.map { |student| student.info }.to_h.sort
  end
end

class Student
  attr_reader :name, :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def info
    [grade, name]
  end
end