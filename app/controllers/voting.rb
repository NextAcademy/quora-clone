post '/upvote_question' do	
	if session[:user_id] == nil
		return "error"		
	else
		vote = QuestionVote.find_by(user_id: session[:user_id], question_id: params[:question_answer_id])
		if vote ==  nil
			vote = QuestionVote.new(user_id: session[:user_id], question_id: params[:question_answer_id], counter: 1)
			vote.save
		elsif vote.counter == -1
			vote.counter = 1
			vote.save
		elsif vote.counter == 1
			vote.destroy
		end

		votes = 0
		cumulated_votes = QuestionVote.where(question_id: vote.question_id)
		cumulated_votes.each do |t|
			votes += t.counter
		end

		return "#{votes}"
	end
end

post '/vote_status' do
	if QuestionVote.find_by(user_id: session[:user_id], question_id: params[:question_answer_id]) == nil
		return "#{'0'}"
	else
		return "#{QuestionVote.find_by(user_id: session[:user_id], question_id: params[:question_answer_id]).counter}"
	end
end

post '/downvote_question' do
	if session[:user_id] == nil
		return "error"		
	else
		vote = QuestionVote.find_by(user_id: session[:user_id], question_id: params[:question_answer_id])
		votes = 0
		if vote ==  nil
			vote = QuestionVote.new(user_id: session[:user_id], question_id: params[:question_answer_id], counter: -1)
			vote.save
		elsif vote.counter == 1
			vote.counter = -1
			vote.save
		elsif vote.counter == -1
			vote.destroy
		end

		cumulated_votes = QuestionVote.where(question_id: vote.question_id)
		cumulated_votes.each do |t|
			votes += t.counter
		end

		return "#{votes}"
	end
end

post '/upvote_answer' do
	if session[:user_id] == nil
		return "error"		
	else
		vote = AnswerVote.find_by(user_id: session[:user_id], answer_id: params[:question_answer_id])
		votes_answer = 0
		if vote ==  nil
			vote = AnswerVote.new(user_id: session[:user_id], answer_id: params[:question_answer_id], counter: 1)
			vote.save
		elsif vote.counter == -1
			vote.counter = 1
			vote.save
		elsif vote.counter == 1
			vote.destroy
		end

		cumulated_votes = AnswerVote.where(answer_id: vote.answer_id)
		cumulated_votes.each do |t|
			votes_answer += t.counter
		end

		return "#{votes_answer}"
	end
end

post '/vote_status_answer' do
	if AnswerVote.find_by(user_id: session[:user_id], answer_id: params[:question_answer_id]) == nil
		return "#{'0'}"
	else
		return "#{AnswerVote.find_by(user_id: session[:user_id], answer_id: params[:question_answer_id]).counter}"
	end
end

post '/downvote_answer' do
	if session[:user_id] == nil
		return "error"		
	else
		vote = AnswerVote.find_by(user_id: session[:user_id], answer_id: params[:question_answer_id])
		votes_answer = 0
		if vote ==  nil
			vote = AnswerVote.new(user_id: session[:user_id], answer_id: params[:question_answer_id], counter: -1)
			vote.save
		elsif vote.counter == 1
			vote.counter = -1
			vote.save
		elsif vote.counter == -1
			vote.destroy
		end

		cumulated_votes = AnswerVote.where(answer_id: vote.answer_id)
		cumulated_votes.each do |t|
			votes_answer += t.counter
		end

		return "#{votes_answer}"
	end
end


