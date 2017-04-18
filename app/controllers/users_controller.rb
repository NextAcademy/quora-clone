# In users_controller.rb

post '/signup' do
  user = User.new(params[:user])
  if user.save
  	session[:user_id] = user.id
    redirect "users/#{user.id}"
  else
  	@error = user.errors.full_messages.first #the error is from the validation whenever you try to save something in
  	#so u cannot use the this same error method in /login because you're not trying to save anything to the database
    erb :"static/index" 
  end
end 

post '/login' do 
  # apply a authentication method to check if a user has entered a valid email and password
  # if a user has successfully been authenticated, you can assign the current user id to a session
  user = User.find_by(email: params[:user][:email])  # Check if the user exists

  if user.try(:authenticate, params[:user][:password]) 
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect "users/#{user.id}"

  else
    # If user's login doesn't work, send them back to the login form.
      @error = "Invalid email or password"
      erb :"static/login"
  end
end	

post '/logout' do #User.destroy DOESNT WORK
  # kill a session when a user chooses to logout, for example, assign nil to a session
  # redirect to the appropriate page
  session[:user_id] = nil
  redirect '/login'  	
end 

get '/login' do 
  erb :"static/login"
end

get '/users/:id' do
  if current_user && current_user.id == params[:id].to_i

    id = params[:id]
	@user = User.find(id)
	erb :"users/profile" 
  else 
	redirect '/login' 
  end 
end

get '/users/:id/my_answer' do 
  erb :"users/my_answer"
end

get '/users/:id/my_question' do 
  erb :"users/my_question"
end