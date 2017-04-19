require 'byebug'

get '/questions' do
	@questions = Question.all
	erb :"static/index"
end

post '/questions' do
	question = Question.new(user_id: session[:user_id], title: params[:question])
	if question.save
		puts "question success"
	else
		puts "question failure"
	end
	redirect '/questions'
end


get '/questions/:question_id' do
	@question = Question.find_by_id(params[:question_id])
	erb :"question/show"
end

get '/questions/:question_id/votes' do
	q_vote = QuestionVote.new(question_id: params[:question_id], user_id: current_user.id)
		byebug
	if q_vote.save
		puts 'vote ssuccess'
	else
		puts 'vote failuar'

	end 
	@questions = Question.all
	erb :"static/index"
end

get '/users/:user_id/questions' do
	@questions = Question.where(user_id: params[:user_id])
	erb :"question/index"
end

