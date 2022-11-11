class Classroom
  def initialize(label)
    @label = label
    @students = object.new
  end
  attr_accessor :label

  def add_student(student)
    @students[student.id] = student
    student.classroom = self
  end
end
