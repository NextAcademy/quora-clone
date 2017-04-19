
get '/signup' do
	erb :'users/new'
end

post '/signup' do
  @user = User.new(params[:user])
	  if @user.save
			flash[:msg] = "Succesfully signed up. Log in to continue"
	    redirect '/login'
	  else
			flash[:msg] = @user.errors.full_messages.join(',')
	    redirect '/signup'
	  end
end


get '/login' do
  redirect '/'
end

post '/login' do
  user = User.find_by(email: params[:email])
	if user.nil?
		flash[:msg] = "Invalid email or password"
		redirect '/login'
	end

  if BCrypt::Password.new(user.password) == params[:password]
		flash[:msg] = "Logged in succesfully"
    session[:user_id] = user.id
		redirect '/dashboard'

  else
		flash[:msg] = "Invalid email or password"
		redirect '/login'
  end
end

post '/logout' do
  session[:user_id] = nil
	flash[:msg] = "Logged out succesfully"
	redirect '/login'
end

get '/dashboard' do
	erb :'users/dashboard'
end


get '/users/:id' do
  @user = User.find_by_id(params[:id])
end
