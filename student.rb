require_relative './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classrooms = object.new
  end

  def add_classroom (classroom)
    classrooms[classroom.id] = classroom
    classroom.student = self
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
