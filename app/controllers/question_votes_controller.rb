require 'byebug'

post '/question_votes' do
	# puts params
	# {"question_vote"=>{"vote"=>"1", "user_id"=>"1", "question_id"=>"2"}, "captures"=>[]}
	# {"question_vote"=>{"vote"=>"-1", "user_id"=>"1", "question_id"=>"2"}, "captures"=>[]}

	@user_id = params[:question_vote][:user_id].to_i
	@question_id = params[:question_vote][:question_id].to_i
	user_voted = QuestionVote.find_by(user_id: @user_id, question_id: @question_id)

	unless user_voted
		question_votes = QuestionVote.new(params[:question_vote])
	else
		question_votes = user_voted
		question_votes.vote += params[:question_vote][:vote].to_i
	end

	if question_votes.save
		redirect back
	else
		@question_votes_errors = question_votes.errors.messages
		@user = User.all
		@questions = Question.all
		@answers = Answer.all
		@question_votes = QuestionVote.all
		erb :"static/index"
	end
end