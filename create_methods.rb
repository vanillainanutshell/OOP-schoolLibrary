module CreateMethods
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_selected = gets.chomp.strip.to_i
    case person_selected
    when 1
      create_student
      @id += 1
    when 2
      create_teacher
      @id += 1
    else
      puts 'Invalid Selection. Returning to main menu'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    if age <= 0
      @id -= 1
      return puts 'Wrong input for age. Returning to main menu'
    end
    print 'Name: '
    name = gets.chomp.strip.capitalize
    print 'Has Parent Permission? [Y/N]'
    permission = gets.chomp.strip.upcase
    case permission
    when 'Y', 'YES'
      permission = true
    when 'N', 'NO'
      permission = false
    else
      puts 'Wrong input for permission'
      @id -= 1
      return
    end
    student = Student.new(@id, age, name, parent_permission: permission)
    @people << student
    puts 'Person created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    if age <= 0
      @id -= 1
      return puts 'Wrong input for age. Returning to main menu'
    end
    print 'Name: '
    name = gets.chomp.strip.capitalize
    print 'Specialization: '
    specialization = gets.chomp.strip.capitalize
    teacher = Teacher.new(age, name, specialization)
    @people << teacher
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp.strip.capitalize
    print 'Author: '
    author = gets.chomp.strip.capitalize
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end
end
