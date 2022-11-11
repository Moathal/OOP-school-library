class Book
  def initialize(title, author)
    @author = author
    @title = title
    @rentals = object.new
  end

  attr_accessor :title, :author

  def add_rental(rental)
    rentals[rental.id] = rental
    rental.book = self
  end
end
