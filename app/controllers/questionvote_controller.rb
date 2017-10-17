post '/homepage/questionvote' do
	if params[ :type] == "up"
		a= 1
	else
		a=-1
	end
	questionvote= Questionvote.new(user_id:current_user.id, question_id: params[ :qid], vote_type: a)
	if questionvote.save
		return {message: "success", votes: questionvote.question.votes}.to_json
	else
		status 400
		return questionvote.errors.full_messages.join(", ").to_json 
	end
end

post '/homepage/answervote' do
	if params[ :type] == "up"
		a= 1
	else
		a=-1
	end
	answervote= Answervote.new(user_id:current_user.id, answer_id: params[ :aid], vote_type: a)
	if answervote.save
		return {message:"success", votes: answervote.answer.votes}.to_json
	else
		status 400
		return answervote.errors.full_messages.join(", ").to_json 
	end
end
