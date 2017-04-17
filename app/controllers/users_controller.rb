enable :sessions

post '/signup' do
	user = User.new(params[:user])
	if user.save
		# do something later
	else
		@error_messages = user.errors.full_messages
		erb :'static/sign_up'
	end
end

post '/login' do 
	user = User.find_by(email:params[:user][:email])
	if !user 
		@no_account = "You do not have an account. Please sign up "
		erb :'static/login'
	else 
		# if user.authenticate(params[:user][:password])
	end
end
