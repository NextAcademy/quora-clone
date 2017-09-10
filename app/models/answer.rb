class Answer < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  validates :content, presence: true
  belongs_to :user
  has_many :answer_votes

  def upvote_answer
    self.update(votes_count: self.votes_count + 1)
  end

  def downvote_answer
    self.update(votes_count: self.votes_count - 1)
  end

end
