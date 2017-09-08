post '/session' do
  # apply a authentication method to check if a user has entered a valid email and password
  # if a user has successfully been authenticated, you can assign the current user id to a session
  @user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
  if @user
  	session[:user_id] = @user.id
  end
  redirect '/'
end

delete '/session' do
  # kill a session when a user chooses to logout, for example, assign nil to a session
  # redirect to the appropriate page
  session.clear
  redirect '/'
end

