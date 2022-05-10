class Person
    reader_attr :id
    accessor_attr :name, :age

    def initialize(id, age, name = "Unknown", parent_permission: true)
        @id = id
        @name = name
        @age = age
        @parent_permission = parent_permission
    END

    def can_use_services?
        @parent_permission || of_age?
    END

    private

    def of_age?
        @age >= 18
    END
end