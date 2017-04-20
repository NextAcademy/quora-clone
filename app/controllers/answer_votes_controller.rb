post '/questions/:id/answers/:aid/upvotes' do
	a_vote = AnswerVote.new(vote_type: "Upvote")
	a_vote.user_id = current_user.id
	a_vote.answer_id = params[:aid]

	existed_vote = AnswerVote.where(answer_id: params[:aid], user_id: current_user.id)[0]

	# new
	if a_vote.save
		flash[:msg] = "Thanks for your vote!"
	# update
	elsif existed_vote.vote_type != "Upvote"
		existed_vote.update(vote_type: "Upvote")
		flash[:msg] = "Updated your vote!"
	# delete
	elsif existed_vote.vote_type == "Upvote"
		AnswerVote.delete(existed_vote.id)
		flash[:msg] = "Removed your vote!"
	end
	upvote = AnswerVote.where(answer_id: params[:aid], vote_type: "Upvote").count
	downvote = AnswerVote.where(answer_id: params[:aid], vote_type: "Downvote").count
	return {"upvote": upvote, "downvote": downvote }.to_json

end

post '/questions/:id/answers/:aid/downvotes' do
	a_vote = AnswerVote.new(vote_type: "Downvote")
	a_vote.user_id = current_user.id
	a_vote.answer_id = params[:aid]

	existed_vote = AnswerVote.where(answer_id: params[:aid], user_id: current_user.id)[0]
	
	# new
	if a_vote.save
		flash[:msg] = "Thanks for your vote!"
	# update
	elsif existed_vote.vote_type != "Downvote"
		existed_vote.update(vote_type: "Downvote")
		flash[:msg] = "Updated your vote!"
	# delete
	elsif existed_vote.vote_type == "Downvote"
		AnswerVote.delete(existed_vote.id)
		flash[:msg] = "Removed your vote!"
	end
	upvote = AnswerVote.where(answer_id: params[:aid], vote_type: "Upvote").count
	downvote = AnswerVote.where(answer_id: params[:aid], vote_type: "Downvote").count
	return {"upvote": upvote, "downvote": downvote }.to_json
end