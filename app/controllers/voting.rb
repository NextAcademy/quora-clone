post '/upvote_question' do
	vote = QuestionVote.find_by(user_id: session[:user_id], question_id: nil)
	@votes = 0
	if vote ==  nil
		a = QuestionVote.new(user_id: session[:user_id], question_id: nil, counter: 1)
		a.save
	elsif vote.question_id == -1
		vote.question_id = 1
		vote.save
	elsif vote.question_id == 1
		vote.destroy
	end

	cumulated_votes = QuestionVote.where(question_id: "#{vote.question_id}")
		cumulated_votes.all do |t|
			@votes+= 1
		end
	end
end

post '/downvote_question' do
	vote = QuestionVote.find_by(user_id: session[:user_id], question_id: nil)
	@votes = 0
	if vote ==  nil
		a = QuestionVote.new(user_id: session[:user_id], question_id: nil, counter: -1)
		a.save
	elsif vote.question_id == 1
		vote.question_id = -1
		vote.save
	elsif vote.question_id == -1
		vote.destroy
	end

	cumulated_votes = QuestionVote.where(question_id: "#{vote.question_id}")
		cumulated_votes.all do |t|
			@votes+= 1
		end
	end
end

post '/upvote_answer' do
	vote = AnswerVote.find_by(user_id: session[:user_id], answer_id: nil)
	@votes = 0
	if vote ==  nil
		a = AnswerVote.new(user_id: session[:user_id], answer_id: nil, counter: 1)
		a.save
	elsif vote.answer_id == -1
		vote.answer_id = 1
		vote.save
	elsif vote.question_id == 1
		vote.destroy
	end

	cumulated_votes = AnswerVote.where(answer_id: "#{vote.answer_id}")
		cumulated_votes.all do |t|
			@votes+= 1
		end
	end
end

post '/downvote_answer' do
	vote = AnswerVote.find_by(user_id: session[:user_id], answer_id: nil)
	@votes = 0
	if vote ==  nil
		a = AnswerVote.new(user_id: session[:user_id], answer_id: nil, counter: -1)
		a.save
	elsif vote.answer_id == 1
		vote.answer_id = -1
		vote.save
	elsif vote.answer_id == -1
		vote.destroy
	end

	cumulated_votes = AnswerVote.where(answer_id: "#{vote.answer_id}")
		cumulated_votes.all do |t|
			@votes+= 1
		end
	end
end


