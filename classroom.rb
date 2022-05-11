class ClassroomManager
    acessor_attr :label, :students

    def initialize(label)
        @label = label
        @students = []
    end

    def add_students(student)
        @students << student
        student.classroom = self
    end
end