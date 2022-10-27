require './lib/course'
require './lib/student'

require 'pry'

RSpec.describe Course do
  let!(:course) {Course.new("Calculus", 2)}
  it 'initializes with a course name and capacity' do
    expect(course.name).to eq "Calculus"
    expect(course.capacity).to eq 2
  end
  it 'starts with an empty array for students' do
    expect(course.students).to eq []
  end
  it 'is not full if students array size is less than capacity' do
    expect(course.full?).to be false
  end
  it 'can enroll student with method, and is full at capacity' do
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})
    course.enroll(student1)
    course.enroll(student2)
    expect(course.full?).to be true
  end
end