require 'byebug'
enable :sessions
######################

=begin

Follow question
===============

within:
- /question/:id
- /index
	
=end

post '/questions/:id/votes' do
	# 1st time choosing
	byebug
	q_vote = QuestionVote.new(vote_type: params[:question_vote][:vote_type])
	q_vote.user_id = current_user.id
	q_vote.question_id = params[:id]

	if q_vote.save
		flash[:msg] = "Thanks for your vote!"
	else
		
		existed_vote_type = QuestionVote.where(question_id: params[:id], user_id: current_user.id)[0].vote_type
		new_vote_type = params[:question_vote][:vote_type]

		# 1st == 2nd time, delete
		if existed_vote_type == new_vote_type
			id = QuestionVote.where(question_id: params[:id], user_id: current_user.id)[0].id
			QuestionVote.delete(id)

		# if 1st != 2nd time, update
		elsif existed_vote_type != new_vote_type
			existed_vote = QuestionVote.where(question_id: params[:id], user_id: current_user.id)[0]
			existed_vote.update(vote_type: new_vote_type)
		end
	end
	# request.url ==> http://localhost:9393/questions/3/votes
	redirect '/'
		
end


