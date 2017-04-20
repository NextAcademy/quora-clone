enable :sessions
# enable :flash


post '/signup' do
  user = User.new(params[:user])
  if user.save
    # what should happen if the user is saved?
    redirect '/'
  else
  	@error_messages = user.errors.full_messages
		erb :'static/sign_up'    						 # MIGHT WORK WITH 'REDIRECT'. SHOULD TRY OUT WHEN THIS WORKS!

  end
end  



post '/login' do 
	result = User.email_password_matches?(params[:user][:email],params[:user][:password])
	if result.nil?
		flash[:no_account] = "You don't have an account. Please sign up "    #theres a problem here it says 'undefined local for flash'
		redirect '/login'     
	else 
		if result.class != String
			session[:user_id] = result.id
			redirect "/users/#{result.id}"
		else 
			flash[:wrong_password] = result
			redirect '/login'
		end 
	end
end


post '/logout' do
	session[:user_id] = nil
	redirect '/'
end


get '/users/:id' do
	if logged_in?
		erb :'users/profile'
	else 
		redirect '/login'
	end
end