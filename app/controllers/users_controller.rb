get '/signup' do
	erb :"static/signup"
end

post '/signup' do
	@user = User.new(params[:user])
	if @user.save
		redirect 'http://google.com'
	else
		redirect 'http://yahoo.com'
	end
end

get '/login' do
	if logged_in?
		redirect '/'
	else
		erb :"static/login"
	end
end

post '/login' do
  # apply a authentication method to check if a user has entered a valid email and password
  # if a user has successfully been authenticated, you can assign the current user id to a session
  @user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
  if @user
  	session[:user_id] = @user.id
  	@notice = "You have successfully logged in"
  	redirect '/'
  else
  	erb :"static/login"
  end
end

get '/logout' do
  # kill a session when a user chooses to logout, for example, assign nil to a session
  # redirect to the appropriate page
  session.clear
  @notice = "You have successfully logged out"
  redirect '/'
end

get '/users/:id' do
	puts 'parms:'
	puts params[:id]
  if (current_user.id == (params[:id]).to_i)
  	erb :"static/user_index"
  else
  	redirect '/'
  end
end