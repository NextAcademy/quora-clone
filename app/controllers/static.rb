get '/' do
  erb :"static/main"
end

post '/signup' do
	@user = User.new(params[:user])
	if @user.save
		redirect '/'
	else
	erb :"static/main"
	end
end

get '/index' do
	if logged_in?
		erb :"static/index"
	end 
end

post '/login' do
  # apply a authentication method to check if a user has entered a valid email and password	
  user = User.find_by(email: params[:email])
  if user.verify(params[:password])#if user is true
  	# if a user# has successfully been authenticated, you can assign the current user id to a
  	session[:current_user_id] = user.id
  	redirect "/index"
  end
  #or 
 #  user = User.find_by(email: params["email"]).try(:authenticate, params["password"])
	# if user
	# 	session[:current_user_id] = user.id
 #  	 	erb :"static/index"
	# end
end

post '/logout' do
  # kill a session when a user chooses to logout, for example, assign nil to a session
  # redirect to the appropriate page
  session[:current_user_id] = nil
  redirect '/'
end

get '/users/:id' do
  # some code here
  @user = User.find(params[:id])
  erb :"static/profile"
end

