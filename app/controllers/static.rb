require 'byebug'

get '/' do
  erb :"static/top"
end

post '/signup' do
	user = User.new(params[:user])

	if user.save	
		puts "signin saved"
		session[:user_id] = user.id
		redirect "/questions"
	else
		puts "signin error"
	end
end

post '/login' do

	user_db = User.find_by_email(params[:user][:email])

	if !user_db.nil?
		#byebug
		if user_db.password == params[:user][:password]
			puts "authentication success"
			session[:user_id] = user_db.id

			#redirect "/users/#{user_db.id}"
			redirect "/questions"
		else
			puts "authentication failure"
			#@eror_msg = "authentication failure"
		end
	end
end

get '/logout' do
	session[:user_id] = nil
	redirect "/"
end

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

post '/questions/:question_id/answers' do

	answer = Answer.new(user_id:session[:user_id], question_id:params[:question_id], content: params[:content])

	if answer.save
		puts "answer success"
		redirect "/questions/#{params[:question_id]}"
	else
		puts "answer failure"		
	end
end

get '/users/:user_id/questions' do
	@questions = Question.where(user_id: params[:user_id])
	erb :"question/index"
end

get '/users/:user_id/answers' do
	@answers = Answer.where(user_id: params[:user_id])
	erb :"answer/index"
end


# get '/users/:user_id/answers' do
# 	@questions = Question.where(user_id: params[:user_id])
# 	erb :"users/index"
# end

# get '/users/:user_id/questions/:question_id/answers' do
# 	@questions = Question.find_by_id(params[:question_id])
# 	erb :"users/index"
# end


# url						 description		  directory structure
# /questios                all questions 		  view/static/index.erb (homepage)
# /users/1/questions      only my questions     view/question/index.erb
# /question/:q_id/answers all answers to a question view/question/show.erb
# /users/1/answers        only my answers     view/answer/index.erb


# /questions
# /question/:q_id/
# /q

