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
     upvote = QuestionVote.where(question_id: params[:id], vote_type: true).count
     downvote = QuestionVote.where(question_id: params[:id], vote_type: false).count
     return {true: upvote, false: downvote}.to_json

end

# post '/questions/:id/downvotes' do
#     q_vote = QuestionVote.new(vote_type: "Downvote")
#     q_vote.user_id = current_user.id
#     q_vote.question_id = params[:id]
#     existed_vote = QuestionVote.where(question_id: params[:id], user_id: current_user.id)[0]
#     # new
#     if q_vote.save
#         flash[:msg] = "Thanks for your vote!"
#     # update
#     elsif existed_vote.vote_type == "Upvote"
#         existed_vote.update(vote_type: "Downvote")
#         flash[:msg] = "Updated your vote!"
#     # delete
#     elsif existed_vote.vote_type == "Downvote"
#         QuestionVote.delete(existed_vote.id)
#         flash[:msg] = "Removed your vote!"
#     end
#     upvote = QuestionVote.where(question_id: params[:id], vote_type: "Upvote").count
#     downvote = QuestionVote.where(question_id: params[:id], vote_type: "Downvote").count
#     return {"upvote": upvote, "downvote": downvote }.to_json
#     # redirect '/'
# end



