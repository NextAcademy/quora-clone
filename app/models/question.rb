class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  validates :title, presence: true
  has_many :answers
  has_many :question_votes

  def upvote_question
    self.update(votes_count: self.votes_count + 1)
  end

  def downvote_question
    self.update(votes_count: self.votes_count - 1)
  end
end
