get '/' do
	erb :"static/index"
end

get '/signup' do
	erb :"users/new"
end

get '/login' do
	erb :"users/login"
end

get '/logout' do
    erb :"static/index"
end

get '/users/:id' do
	@user= User.find(params[:id])
	erb :"users/show"
end

post '/signup' do
	@user = User.new(params[:user])
	if @user.save
		session[:user_id] = @user.id
		redirect to '/'
	else
		@error = @user.errors.messages
		erb :"/signup"
	end
end

post '/login' do
	
	@login_user = User.find_by_email(params[:user][:email])
	
	if  @login_user == nil
		@login_error = "Invalid email"
		erb :"users/login"

	elsif @login_user.authenticate_login(params[:user][:email], params[:user][:password]) == true 
		session[:user_id] = @login_user.id
		redirect to "/users/#{@login_user.id}"
		
	else
		@login_error = "Incorrect password"
		erb :"users/login"
		
	end
end

post '/logout' do
	
	session[:user_id] = nil
	redirect to '/'
	
end