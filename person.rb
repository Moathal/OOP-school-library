require_relative './nameable'

class Person < Nameable
  def initialize(age, name = 'unknown', parent_permission: true)
    @id = rand(1..10_000)
    super()
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
