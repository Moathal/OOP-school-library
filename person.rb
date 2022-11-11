require_relative './nameable'

class Person < Nameable
  def initialize(id, age, name = 'unknown', parent_permission: true)
    @id = id
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = object.new
  end

  attr_accessor :name, :age, :id, rentals

  def can_use_services?
    of_age? || parent_permission ? true : false
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    rentals[rental.id] = rental
    rental.person = self
  end

  private

  def of_age?
    @age >= 18
  end
end
