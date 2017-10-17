get '/question/:id/upvote' do

	if session[:user_id]
		@question = Question.find(params[:id])
		@question_vote = QuestionVote.find_by(question_id: @question.id, user_id: current_user.id)

		if @question_vote != nil
			@question_vote.delete
		else
			@question_vote = QuestionVote.create(question_id: @question.id, vote: 1, user_id: current_user.id)
		end
		redirect '/main'

	else
		@message = "Please log in or sign up to vote."
		erb :"static/index"
	end
end

get '/question/:id/downvote' do
	
	if session[:user_id]
		@question = Question.find(params[:id])
		@question_vote = QuestionVote.find_by(question_id: @question.id, user_id: current_user.id)

		if @question_vote != nil
		   @question_vote.delete
		else
			@question_vote = QuestionVote.create(question_id: @question.id, vote: -1, user_id: current_user.id)
		end
		redirect '/main'

	else
		@message = "Please log in or sign up to vote."
		erb :"static/index"
	end
end