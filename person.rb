require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  reader_attr :id, :rentals
  accessor_attr :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  def correct_name
    @name
  end

  def create_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
