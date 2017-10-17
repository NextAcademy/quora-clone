get '/answer/:id/upvote' do

	if session[:user_id]
		@answer = Answer.find(params[:id])
		@answer_vote = AnswerVote.find_by(answer_id: @answer.id, user_id: current_user.id)

		if @answer_vote != nil
			@answer_vote.delete
		else
			@answer_vote = AnswerVote.create(answer_id: @answer.id, vote: 1, user_id: current_user.id)
		end
		redirect '/main'

	else
		@message = "Please log in or sign up to vote."
		erb :"static/index"
	end
end

get '/answer/:id/downvote' do
	
	if session[:user_id]
		@answer = Answer.find(params[:id])
		@answer_vote = AnswerVote.find_by(answer_id: @answer.id, user_id: current_user.id)

		if @answer_vote != nil
		   @answer_vote.delete
		else
			@answer_vote = AnswerVote.create(answer_id: @answer.id, vote: -1, user_id: current_user.id)
		end
		redirect '/main'

	else
		@message = "Please log in or sign up to vote."
		erb :"static/index"
	end
end