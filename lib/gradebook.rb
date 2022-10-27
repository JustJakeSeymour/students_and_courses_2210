class Gradebook

  attr_reader :courses
  
  def initialize(hash)
    @hash = hash
    @courses = []
  end

  def instructor
    @hash[:instructor]
  end
  
  def department
    @hash[:department]
  end

  def assign_course(course)
    @courses << course
  end

  def course_list
    @courses.map do |course|
      course.name
    end
  end

  def student_list(course)
    course.students.map do |student|
      student.name
    end
  end

  def student_list_low_grades(course)
    students_with_low_grades = []
    course.students.find_all do |student|
      if student.grade < 70
       students_with_low_grades << student.name
      end
    end
    students_with_low_grades
  end

end