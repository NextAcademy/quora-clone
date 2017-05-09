enable :sessions

post "/question/:id/answer/:a_id/upvote" do 
   #@answer = Answer.find(params[:a_id])
   @question = Question.find(params[:id])
  # current_vote = QuestionVote.where(user_id: current_user.id, question_id: params[:id]).first
  current_vote = current_user.answer_votes.find_by(answer_id: params[:a_id])
  if current_vote.nil?
    @vote = current_user.answer_votes.new(answer_id: params[:id], vote_type: true)
    
    if @vote.save
      return AnswerVote.where(answer_id: params[:id], vote_type: true).count.to_json
      #@vote = QuestionVote.where("question_id = ? and upvote = ?", params)
      #redirect "/question/#{params[:id]}"
    else
     # status 400
     return @vote.errors.full_messages.first
    end 
   
  else
    current_vote.destroy
    # if current_vote.vote_type
    #   current_vote.update_attribute(:vote_type, false) #==> update_attribute will not stop by callbacks
    # elsif !current_vote.vote_type
    #   current_vote.update_attribute(:vote_type, true)
    # end
    return AnswerVote.where(answer_id: params[:id], vote_type: true).count.to_json
    #redirect "/"
  end
end


