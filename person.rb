class Person
  reader_attr :id
  accessor_attr :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    @parent_permission || is_of_age?
  end

  private

  def is_of_age?
    @age >= 18
  end
end
