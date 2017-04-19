enable :sessions

post "/question/:id/upvote" do
  # @question = Question.find(params[:id])
  # current_vote = QuestionVote.where(user_id: current_user.id, question_id: params[:id]).first
  current_vote = current_user.question_votes.find_by(question_id: params[:id])
  if current_vote.nil?
    @vote = current_user.question_votes.new(question_id: params[:id], vote_type: true)
    @vote.save
    redirect "/"
  else
    current_vote.destroy
    # if current_vote.vote_type
    #   current_vote.update_attribute(:vote_type, false) #==> update_attribute will not stop by callbacks
    # elsif !current_vote.vote_type
    #   current_vote.update_attribute(:vote_type, true)
    # end
    redirect '/'
  end
end


