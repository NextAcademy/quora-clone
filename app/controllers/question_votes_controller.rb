require 'byebug'

post '/vote_up/:id' do
	id = params[:id]
	x = Question.find(id)
	# byebug
	y = QuestionVote.find_by(user_id:current_user.id, question_id:x.id)
	if y == nil
		y = QuestionVote.create(user_id:current_user.id, question_id:x.id)		
	else
	end
	# z = y.user_id
	# a = QuestionVote.find_by(user_id:current_user.id)
	if y.question_vote < 1
			y.update(question_vote:y.question_vote+1)	
	else
	end	
	# byebug
	redirect "/quora_questions"
end

post '/vote_down/:id' do
	id = params[:id]
	x = Question.find(id)
	# byebug
	y = QuestionVote.find_by(user_id:current_user.id, question_id:x.id)
	if y == nil
		y = QuestionVote.create(user_id:current_user.id, question_id:x.id)		
	else
	end
	# z = y.user_id
	# a = QuestionVote.find_by(user_id:current_user.id)
	if y.question_vote > -1
			y.update(question_vote:y.question_vote-1)	
	else
	end	
	
	redirect "/quora_questions"
end


# post '/vote_up/:id' do
# 	id = params[:id]
# 	x = Question.find(id)
# 	# p x
# 	y = QuestionVote.find_by(user_id:current_user.id, question_id:x.id)
# 	# z = y.user_id
# 	# a = QuestionVote.find_by(user_id:current_user.id)
# 	if y.question_vote < 1
# 			y.update(question_vote:y.question_vote+1)	
# 	else
# 	end	
	
# 	redirect "/quora_questions"
# end

# post '/vote_down/:id' do
# 	id = params[:id]
# 	x = Question.find(id)
# 	y = QuestionVote.find_by(question_id:x.id)
# 	# z = y.user_id
# 	a = QuestionVote.find_by(user_id:current_user.id)
# 	if a.question_vote > -1
# 			a.update(question_vote:y.question_vote-1)	
# 	else
# 	end	
	
# 	redirect "/quora_questions"
# end


# post '/vote/:content' do
# 	# x = QuestionVote.find($test)
# 	content = params[:content]
# 	x = Question.find_by(content:content)
# 	y = QuestionVote.find_by(question_id:x.id)
# 	# z = y.user_id
# 	# if condition
				
# 	# else
		
# 	# end	
# 	y.update(question_vote:y.question_vote+1)
# 	redirect "/quora_questions"
# end