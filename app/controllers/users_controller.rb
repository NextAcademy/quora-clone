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

enable :sessions

get '/login' do
	erb :"static/login"
end

post '/login' do
  # apply a authentication method to check if a user has entered a valid email and password
  # if a user has successfully been authenticated, you can assign the current user id to a session
  @user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
  if @user
  	session[:id] = SecureRandom.hex(64)
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