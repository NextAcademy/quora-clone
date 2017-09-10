require 'byebug'

post '/question_votes' do
	# puts params
	# {"question_vote"=>{"vote"=>"1", "user_id"=>"1", "question_id"=>"2"}, "captures"=>[]}
	# {"question_vote"=>{"vote"=>"-1", "user_id"=>"1", "question_id"=>"2"}, "captures"=>[]}

	question_votes = QuestionVote.new(params[:question_vote])
	if question_votes.save
		redirect back
	else
		@question_votes_errors = question_votes.errors.messages
		erb :"static/index"
	end
end