post '/question_votes' do
	# puts params
	# 

	question_votes = QuestionVote.new(params[:question_votes])
	if question_votes.save
		redirect back
	else
		@question_votes_errors = question_votes.errors.messages
		erb :"static/index"
	end
end