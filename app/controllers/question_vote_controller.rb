enable :sessions

post "/question/:id/upvote" do
  # @question = Question.find(params[:id])
  # current_vote = QuestionVote.where(user_id: current_user.id, question_id: params[:id]).first
  current_upvote = current_user.question_votes.find_by(question_id: params[:id])
  if current_upvote.nil?
    @vote = current_user.question_votes.new(question_id: params[:id], vote_type: true)
    
    if @vote.save
      return QuestionVote.where(question_id: params[:id], vote_type: true).count.to_json
      #@vote = QuestionVote.where("question_id = ? and upvote = ?", params)
      # redirect "/"
    else
     # status 400
     return @vote.errors.full_messages.first
    end 

  else
    current_upvote.destroy
    # if current_vote.vote_type
    #   current_vote.update_attribute(:vote_type, false) #==> update_attribute will not stop by callbacks
    # elsif !current_vote.vote_type
    #   current_vote.update_attribute(:vote_type, true)
    # end
    return QuestionVote.where(question_id: params[:id], vote_type: true).count.to_json
    # redirect '/'
  end
end


post "/question/:id/downvote" do
  # @question = Question.find(params[:id])
  # current_vote = QuestionVote.where(user_id: current_user.id, question_id: params[:id]).first
  current_downvote = current_user.question_votes.find_by(question_id: params[:id])
  if current_downvote.nil?
    @vote = current_user.question_votes.new(question_id: params[:id], vote_type: false)

    if @vote.save
      return QuestionVote.where(question_id: params[:id], vote_type: false).count.to_json
      #@vote = QuestionVote.where("question_id = ? and upvote = ?", params)
      #redirect "/"
    else
     #status 400
     return @vote.errors.full_messages.first
    end 

  else
    current_downvote.destroy
    # if current_vote.vote_type
    #   current_vote.update_attribute(:vote_type, false) #==> update_attribute will not stop by callbacks
    # elsif !current_vote.vote_type
    #   current_vote.update_attribute(:vote_type, true)
    # end
    #flash[:msg] = "ACCESS DENIED"
    # return @vote.errors.full_messages.first
    return QuestionVote.where(question_id: params[:id], vote_type: false).count.to_json
    #redirect '/'
  end
end



