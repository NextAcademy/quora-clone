post '/signup' do
	@user = User.new(params[:user])
	if @user
	   @user.save
	   session[:user_id] = @user.id
	@message = "Signed up. You may now login."
	else
		@message = @user.errors.full_messages.join(", ")
	end
	redirect to '/'
end


post '/login' do
  @user = User.find_by(email:params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])   # user is found and the password user keyed in matches with sign up password
    session[:user_id] = @user.id
    redirect '/main'
  else
  	@message = "User not found"
  	erb :"static/index"
  end
end



get '/main' do
	@answer = Answer.where(user_id: current_user.id)
	erb :"user/main"
end


get '/user/:id' do
	@user= User.find(params[:id])
	@question = Question.where(user_id: current_user.id)
	erb :"user/profile"
end

get '/user/:id/update' do
	erb :"user/edit"
end


post '/user/:id/update' do
	@user = User.find(params[:id])
	if @user.update(params[:user]) 
		@message = "Profile updated."
		erb :"user/main"
	end
end



get '/logout' do
	session[:user_id] = nil
	@message = "You have successfully logged out."
	redirect to '/'
end

post '/other' do
	@user = User.find_by(first_name:params[:user][:first_name])
	if @user
		@question = Question.where(user_id: @user.id)
    	erb :"user/other"
  else
  	@message1 = "User not found"
  	redirect to '/main'
  end
end

