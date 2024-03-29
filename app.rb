require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'create_methods'
require_relative 'list_methods'

class App
  include CreateMethods
  include ListMethods

  def initialize
    @people = []
    @books = []
    @id = 50
  end

  def run
    selection = nil
    puts 'Welcome to School Library App!'
    while selection != 7
      display_options
      selection = gets.chomp.strip.to_i
      puts
      do_task(selection)
    end
    puts 'Thank you for using this app!'
  end

  def display_options
    options = [
      'Please choose an option by entering a number:',
      '1 - List all books',
      '2 - List all people',
      '3 - Create a person',
      '4 - Create a book',
      '5 - Create a Rental',
      '6 - List all rentals for a given person id',
      '7 - Exit'
    ]

    options.each { |option| puts option }
  end

  def do_task(selection)
    case selection
    when 1, 2, 6
      list_tasks(selection)
    when 3, 4, 5
      create_tasks(selection)
    when 7
      nil
    else
      puts 'Please select a valid choice from the list'
    end
  end

  def list_tasks(selection)
    case selection
    when 1
      list_all_books
    when 2
      list_all_people
    when 6
      list_person_rentals
    end
  end

  def create_tasks(selection)
    case selection
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    end
  end
end
