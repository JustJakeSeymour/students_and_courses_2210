require './lib/student'

RSpec.describe Student do
  let!(:student) {Student.new({name: "Morgan", age: 21})}
  it 'initializes with a hash with two keys, name and age' do
    expect(student).to be_a Student
    expect(student.name).to eq "Morgan"
    expect(student.age).to eq 21
  end
  it 'starts with an empty array for scores' do
    expect(student.scores).to eq []
  end
  it 'can add scores to array with method' do
    student.log_score(89)
    student.log_score(78)
    expect(student.scores).to eq [89, 78]
  end
  it 'can find average of scores' do
    student.log_score(89)
    student.log_score(78)
    expect(student.grade).to eq 83.5
  end
end