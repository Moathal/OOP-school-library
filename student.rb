require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(id, age, name: 'Unknown', parent_permission: true)
    super
    @classrooms = {}
  end

  def add_classroom(classroom)
    classrooms[classroom.id] = classroom
    classroom.student = self
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
