post '/vote_ans_up/:id' do
	id = params[:id]
	x = Answer.find(id)
	y = AnswerVote.find_by(user_id:current_user.id, answer_id:x.id)
	if y == nil
		y = AnswerVote.create(user_id:current_user.id, answer_id:x.id)		
	else
	end
	if y.answer_vote < 1
			y.update(answer_vote:y.answer_vote+1)	
	else
	end	
	# byebug
	@question = Question.find(x.question_id)
	erb :"answers/show"
end

post '/vote_ans_down/:id' do
	id = params[:id]
	x = Answer.find(id)
	y = AnswerVote.find_by(user_id:current_user.id, answer_id:x.id)
	if y == nil
		y = AnswerVote.create(user_id:current_user.id, answer_id:x.id)		
	else
	end
	if y.answer_vote > -1
			y.update(answer_vote:y.answer_vote-1)	
	else
	end	
	# byebug
	@question = Question.find(x.question_id)
	erb :"answers/show"
end