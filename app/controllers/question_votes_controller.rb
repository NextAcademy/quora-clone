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

post '/questions/:id/upvotes' do
	q_vote = QuestionVote.new(vote_type: "Upvote")
	q_vote.user_id = current_user.id
	q_vote.question_id = params[:id]

	existed_vote = QuestionVote.where(question_id: params[:id], user_id: current_user.id)[0]

	# new
	if q_vote.save
		flash[:msg] = "Thanks for your vote!"
	# update
	elsif existed_vote.vote_type == "Downvote"
		existed_vote.update(vote_type: "Upvote")
		flash[:msg] = "Updated your vote!"
	# delete
	elsif existed_vote.vote_type == "Upvote"
		QuestionVote.delete(existed_vote.id)
		flash[:msg] = "Removed your vote!"
	end
	upvote = QuestionVote.where(question_id: params[:id], vote_type: "Upvote").count
	downvote = QuestionVote.where(question_id: params[:id], vote_type: "Downvote").count
	return {"upvote": upvote, "downvote": downvote }.to_json
	# redirect '/'  <--- with AJAX, this is not needed
end

post '/questions/:id/downvotes' do
	q_vote = QuestionVote.new(vote_type: "Downvote")
	q_vote.user_id = current_user.id
	q_vote.question_id = params[:id]

	existed_vote = QuestionVote.where(question_id: params[:id], user_id: current_user.id)[0]

	# new
	if q_vote.save
		flash[:msg] = "Thanks for your vote!"
	# update
	elsif existed_vote.vote_type == "Upvote"
		existed_vote.update(vote_type: "Downvote")
		flash[:msg] = "Updated your vote!"
	# delete
	elsif existed_vote.vote_type == "Downvote"
		QuestionVote.delete(existed_vote.id)
		flash[:msg] = "Removed your vote!"
	end
	upvote = QuestionVote.where(question_id: params[:id], vote_type: "Upvote").count
	downvote = QuestionVote.where(question_id: params[:id], vote_type: "Downvote").count
	return {"upvote": upvote, "downvote": downvote }.to_json
	# redirect '/'
end

################################################

=begin

A FORM SHOULDN'T HAVE 2 BUTTONS

=end


# post '/questions/:id/votes' do
# 	# 1st time choosing
# 	params
# 	byebug
# 	q_vote = QuestionVote.new(vote_type: params[:question_vote][:vote_type])
# 	q_vote.user_id = current_user.id
# 	q_vote.question_id = params[:id]

# 	if q_vote.save
# 		flash[:msg] = "Thanks for your vote!"
# 	else
		
# 		existed_vote_type = QuestionVote.where(question_id: params[:id], user_id: current_user.id)[0].vote_type
# 		new_vote_type = params[:question_vote][:vote_type]

# 		# 1st == 2nd time, delete
# 		if existed_vote_type == new_vote_type
# 			id = QuestionVote.where(question_id: params[:id], user_id: current_user.id)[0].id
# 			QuestionVote.delete(id)
# 			flash[:msg] = "Removed your vote!"

# 		# if 1st != 2nd time, update
# 		elsif existed_vote_type != new_vote_type
# 			existed_vote = QuestionVote.where(question_id: params[:id], user_id: current_user.id)[0]
# 			existed_vote.update(vote_type: new_vote_type)
# 			flash[:msg] = "Updated your vote!"
# 		end
# 	end
# 	# request.url ==> http://localhost:9393/questions/3/votes
# 	redirect '/'
# end

# ###########################################

# post '/questions/:id/answers/:aid/votes' do
# 	# 1st time choosing
# 	params
# 	byebug
# 	a_vote = AnswerVote.new(vote_type: params[:answer_vote][:vote_type])
# 	a_vote.user_id = current_user.id
# 	a_vote.answer_id = params[:aid]

# 	if a_vote.save
# 		flash[:msg] = "Thanks for your answer vote!"
# 	else
# 		byebug
# 		existed_vote_type = AnswerVote.where(answer_id: params[:aid], user_id: current_user.id)[0].vote_type
# 		new_vote_type = params[:answer_vote][:vote_type]

# 		# 1st == 2nd time, delete
# 		if existed_vote_type == new_vote_type
# 			id = AnswerVote.where(answer_id: params[:aid], user_id: current_user.id)[0].id
# 			AnswerVote.delete(id)
# 			flash[:msg] = "Removed your answer vote!"
# 			byebug

# 		# if 1st != 2nd time, update
# 		elsif existed_vote_type != new_vote_type
# 			existed_vote = AnswerVote.where(answer_id: params[:aid], user_id: current_user.id)[0]
# 			existed_vote.update(vote_type: new_vote_type)
# 			flash[:msg] = "Updated your answer vote!"
# 			byebug
# 		end
# 	end
# 	redirect '/'
# end
