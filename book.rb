class Book
    acessor_attr :title, :author
    reader_attr :rentals

    def initialize(title, author)
        @title = title
        @author = author
        @rentals = []
    end

    def create_rental(date, person)
        Rental.new(date, safe, person)
    end
end