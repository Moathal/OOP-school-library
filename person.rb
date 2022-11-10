require_relative './nameable'

class Person < Nameable
  def initialize(age, name = 'unknown', parent_permission: true)
    @id = rand(1..10000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  def can_use_services?
    of_age? || parent_permission ? true : false
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, 'maximilianus')
  p person.correct_name
  capitalizedPerson = CapitalizeDecorator.new(person)
  p capitalizedPerson.correct_name
  capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
  p capitalizedTrimmedPerson.correct_name
