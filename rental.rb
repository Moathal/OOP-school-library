class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals[@date] = self
    @person = person
    person.rentals[@date] = self
  end
end
