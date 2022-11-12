class Book
  def initialize(id, title, author)
    @id = id
    @author = author
    @title = title
    @rentals = {}
  end

  attr_accessor :id, :title, :author, :rentals

  def add_rental(rental)
    rentals[rental.id] = rental
    rental.book = self
  end
end
