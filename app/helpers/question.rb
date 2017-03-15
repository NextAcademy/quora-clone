helpers do

  def random_questions
    Question.all.sample(5).uniq
  end
end
