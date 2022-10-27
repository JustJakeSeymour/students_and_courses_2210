require './lib/gradebook'
require './lib/course'
require './lib/student'

require 'pry'

RSpec.describe Gradebook do
  let!(:gradebook) {Gradebook.new({instructor: "Vigo", department: "Drama"})}
  let!(:course1) {Course.new("Acting", 2)}
  let!(:course2) {Course.new("Stage Lighting", 3)}
  let!(:student1) {Student.new({name: "Morgan", age: 21})}
  let!(:student2) {Student.new({name: "Jordan", age: 29})}
  let!(:student3) {Student.new({name: "Danny", age: 20})}
  it 'starts with an instructor' do
    expect(gradebook.instructor).to eq "Vigo"
    expect(gradebook.department).to eq "Drama"
  end
  it 'can have courses and will list the courses' do
    gradebook.assign_course(course1)
    gradebook.assign_course(course2)
    expect(gradebook.course_list).to eq ["Acting", "Stage Lighting"]
  end
  it 'can list the students in a course' do
    course1.enroll(student1)
    course1.enroll(student2)
    course2.enroll(student3)
    gradebook.assign_course(course1)
    gradebook.assign_course(course2)
    expect(gradebook.student_list(course1)).to eq ["Morgan", "Jordan"]
  end
end