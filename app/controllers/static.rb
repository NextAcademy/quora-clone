enable :sessions

get '/' do
  erb :"static/index"
end



post '/signup' do
	@user = User.new(params[:user])
	if @user.save
		@message = "Thank you for signing up."
		# session[:id] = @user.id
		erb :"static/home"
	else
		@message = @user.errors.full_messages.join(", ")
		erb :"static/index"
	end
end




post '/login' do

	 @user = User.find_by(email: params["user"]["email"])

	 if @user && @user.authenticate(params["user"]["password"])
	
	 	session[:id] = @user.id
	 	erb :"static/home"
	else 
		erb :"static/index"

	end
end

post 'logout' do
	session[:id]= nil
	erb :"static/index"
end
