enable :sessions

get '/' do
	if current_user
	  erb :"static/index"
	else
		erb :"static/login"
	end
end

get '/sessions/new' do
	erb :"static/login"
end

get '/users/new' do
	erb :"static/signup"
end

delete '/sessions/:id' do
	session[:id] = nil
	erb :"static/login"
end


post '/users' do
  user = User.new(params[:user])
	if user.save
		session[:id] = user.id
		erb :"static/index"
		#redirect "user_profile/#{user.id}"
	else
		@errors = user.errors.full_messages
		erb :'static/login'
	end
end

post '/sessions' do
	user = User.find_by(email: params[:user][:email])
	if user.nil?
		@errors = ["Sorry, we don't have an account with the email address '#{params[:user][:email]}'."]
		erb :'static/login'
	else
		if user.authenticate(params[:user][:password])   
			session[:id] = user.id
			erb :"static/index"
			#redirect "users/#{user.id}"
		else
			@errors = ["Hi #{user.first_name}, unfortunately the password that you entered is incorrect."]
			erb :'static/login'
		end
	end
end


get "/users/:id" do
	if current_user && current_user.id == params[:id].to_i
		id = params[:id]
		@user = User.find(id)
		erb :"users/profile"
	else
		redirect "/sessions/new"
	end
end

post "/questions" do
	question = Question.new(params[:question])
	question.user_id = current_user.id
	if question.save
		p question
		erb :"static/index"
	end
end

post "/answers" do
	answer = Answer.new(params[:answer])
	answer.user_id = current_user.id
	if answer.save
		p answer
		erb :"static/index"
	end
end

get "/questions/:id" do
	@question = Question.find(params[:id])
	erb :"questions/question"
end

get "/user/:id/questions" do
	@user = User.find(params[:id])
	erb :"users/questions"
end

get "/user/:id/answers" do
	@user = User.find(params[:id])
	erb :"users/answers"
end


