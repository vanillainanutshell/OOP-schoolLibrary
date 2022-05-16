module ListMethods
  def list_all_people
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def list_all_books
    @books.each_with_index { |book, index| puts %{#{index}) Title: \"#{book.title}\", Author: #{book.author}} }
  end

  def create_rental
    puts 'Select a book from  the following list by number'
    list_all_books
    book_selected = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    list_all_people
    person_selected = gets.chomp.to_i
    puts
    print 'Date ( YYYY/MM/DD ): '
    date = gets.chomp.strip
    Rental.new(date, @books[book_selected], @people[person_selected])
    puts 'Rental created successfully'
  end

  def list_person_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals: '
    @people.each do |person|
      next unless person.id == id

      person.rentals.each do |rental|
        puts %(Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author})
      end
    end
  end
end
