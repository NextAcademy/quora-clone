post '/upvote_question' do
	vote = QuestionVote.find_by(user_id: session[:user_id], question_id: 4)
	@votes = 0
	if vote ==  nil
		a = QuestionVote.new(user_id: session[:user_id], question_id: 4, counter: 1)
		a.save
	elsif vote.counter == -1
		vote.counter = 1
		vote.save
	elsif vote.counter == 1
		vote.destroy
	end

	cumulated_votes = QuestionVote.where(question_id: vote.question_id)
	cumulated_votes.each do |t|
		@votes += 1
	end

	erb :"users/function"
end

post '/downvote_question' do
	vote = QuestionVote.find_by(user_id: session[:user_id], question_id: nil)
	@votes = 0
	if vote ==  nil
		a = QuestionVote.new(user_id: session[:user_id], question_id: nil, counter: -1)
		a.save
	elsif vote.counter == 1
		vote.counter = -1
		vote.save
	elsif vote.counter == -1
		vote.destroy
	end

	cumulated_votes = QuestionVote.where(question_id: "#{vote.question_id}")
	cumulated_votes.each do |t|
		@votes += 1
	end
	erb :"users/function"
end

post '/upvote_answer' do
	vote = AnswerVote.find_by(user_id: session[:user_id], answer_id: nil)
	@votes_answer = 0
	if vote ==  nil
		a = AnswerVote.new(user_id: session[:user_id], answer_id: nil, counter: 1)
		a.save
	elsif vote.counter == -1
		vote.counter = 1
		vote.save
	elsif vote.counter == 1
		vote.destroy
	end

	cumulated_votes = AnswerVote.where(answer_id: "#{vote.answer_id}")
	cumulated_votes.each do |t|
		@votes_answer += 1
	end
end

post '/downvote_answer' do
	vote = AnswerVote.find_by(user_id: session[:user_id], answer_id: nil)
	@votes_answer = 0
	if vote ==  nil
		a = AnswerVote.new(user_id: session[:user_id], answer_id: nil, counter: -1)
		a.save
	elsif vote.counter == 1
		vote.counter = -1
		vote.save
	elsif vote.counter == -1
		vote.destroy
	end

	cumulated_votes = AnswerVote.where(answer_id: "#{vote.answer_id}")
	cumulated_votes.each do |t|
		@votes_answer+= 1
	end
end


