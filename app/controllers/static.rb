
get '/' do
	if logged_in? 
		redirect '/users/' + current_user.id.to_s
	else
  erb :"static/index"
	end
end

get '/signup' do 
	erb :"static/signup"
end

post '/createuser' do 
	if params[:password] == params[:retype]
	User.create(name: params[:name2], password: params[:password])
	redirect '/'
	else 
		redirect '/signup'
	end
end	

post '/login' do 
	@user = User.find_by_name(params[:user][:name])
	if @user != nil && @user.authenticate(params[:user][:password])
		session[:user_id] = @user.id  #<<
		redirect '/users/' + @user.id.to_s
		else
		redirect '/'
	end
end



get '/users/:user_id' do
	@x = User.find_by(id: params[:user_id])
	@quest = @x.questions
	erb :"static/user"
end

post '/logout' do 
	session[:user_id] = nil
	
	redirect '/'
end

post '/createquestion' do 
	x = Question.create(question: params[:question][:text], user_id: current_user.id)
	redirect '/'
end

get '/questions/:question_id' do 
	@v = Question.find_by(id: params[:question_id])
	@ans = @v.answers

	erb :"static/questionanswer"
end

post '/createanswer' do
	Answer.create(answer: params[:blood], question_id: params[:darren], user_id: current_user.id)
	redirect '/questions/' + params[:darren].to_s
end

get '/questionsall' do
	@a = Question.all
	erb :"static/allquestion"
end

# User.last.questions.last.answers.

post '/upvote' do
	x = Voteanswer.find_by(answer_id: params[:something])
	x.user_id = current_user.id
	a_count = x.user_id.to_s
	x.save
	redirect "/questions/" + params[:chicken].to_s
end