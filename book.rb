class Book
  attr_acessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def create_rental(date, person)
    Rental.new(date, self, person)
  end
end
