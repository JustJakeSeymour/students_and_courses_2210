class Student

  attr_reader :scores

  def initialize(hash)
   @hash = hash
   @scores = []
  end
  
  def name
    @hash[:name]
  end

  def age
    @hash[:age]
  end

  def log_score(score)
    @scores << score
  end
  
  def grade
    @scores.sum(0.0) / @scores.size
  end

end