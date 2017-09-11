require 'byebug'

before do
	# set default title
	@title = "Quora Clone"
end

get '/' do
	@user = User.all
	@questions = Question.all
	@answers = Answer.all
	@question_votes = QuestionVote.all
	@answer_votes = AnswerVote.all
  erb :"static/index"
end

# create
post '/signup' do
	# feature specific to Rails/Sinatra
	# when the form input name is in the format of name="user[attr]"
	# we can use User.new(params[:user])
	# form value is automatically transformed into a hash
	user = User.new(params[:user])
	if user.save
		redirect "/"
	else
		@errors = user.errors.messages
		erb :"static/index"
	end
end

post '/login' do
	# puts params
	# {"user"=>{"email"=>"leesiewching22@gmail.com", "password"=>"password"}, "captures"=>[]}

	# apply authentication method
	# @user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])

	# Extend your MODEL
	# Best practice - authentication login should live in MODEL
	user = User.authenticate(params[:user])
	
	if user
		# assign current user id to a session
		session[:user_id] = user.id
		redirect "/"
	else
		# error message
		@errors = {}
		erb :"static/index"
	end

	# References
	# https://learn.co/lessons/sinatra-user-auth
end

post '/logout' do
	# kill a session
	session.clear
	# redirect to login page
	redirect "/"
end

# show user profile page
get '/users/:id' do
	@user = User.find_by_id(params[:id])
	@title = @user.name + " - Quora Clone"
	@answers_user = Answer.where(user_id: @user.id).order(created_at: :desc)
	@questions_user = Question.where(user_id: @user.id).order(created_at: :desc)
	@questions = Question.all
	@question_votes = QuestionVote.all
	@answer_votes = AnswerVote.all
	erb :"static/profile"
end
