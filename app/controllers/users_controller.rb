# In users_controller.rb
post '/signup' do
  user = User.new(params[:user])
  if user.save
    redirect '/profile'
  else
  	@error = @user.errors.full_messages.first
    render '/'
  end
end 

post '/login' do #go profile page
  user = User.find_by_email(params[:email])  # Check if the user exists
  if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect '/'
  else
    # If user's login doesn't work, send them back to the login form.
      redirect '/login'
  end
end	

  # apply a authentication method to check if a user has entered a valid email and password
  # if a user has successfully been authenticated, you can assign the current user id to a session

post '/logout' do
  session[:user_id] = nil
  redirect_to '/login'  	
  # kill a session when a user chooses to logout, for example, assign nil to a session
  # redirect to the appropriate page
end 

get '/login' do 
  erb :"static/login"
end

get '/users/:id' do
	id = params[:id]
	@user = User.find(id)
	erb :"users/profile" 
end

# User visits log in page ->   
# User keys in email and password ->   
# User hits submit ->   
# Our app should check if they keyed in the correct credentials ->   
# If yes, log the user in. If not, show an error.