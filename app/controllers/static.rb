# enable :sessions

get '/' do
	# byebug
	# session[:user_id] = nil 
	if session[:user_id] != nil 
		erb :"static/home"
	else 
  		erb :"static/index"
  	end 
end

post '/create_user' do 
	user = User.new(name: params[:name], email: params[:email], password: params[:password], 
		password_confirmation: params[:confirmation_password])

	if user.save 
		session[:user_id]= user[:id]
		redirect "/home"
	else 
		@error = "Asdsa"
		erb :"static/index"
	end 
end 

get '/home' do 
	# byebug
	erb :"static/home"
end 

post "/login" do 
	puts params
	# user = User.find_by(email: params[:email])
	puts "++++++++++++++++++++++++++"
	# user.authenticate(params[:password])
	login = User.find_by(email: params[:email]).try(:authenticate, params[:password]) 
	# byebug
	if login == false 
		@error1 = 'asdasda'
		erb :"static/index"
	else  
		session[:user_id]= login[:id]
		# byebug
		redirect "/home"
	end 
end 

post "/logout" do 
	session[:user_id] = nil 
	redirect "/"
end 

get "/user" do 
	# byebug/
	# puts params 
	@user = User.find_by(id: session[:user_id])
	puts "+++++++++++++++++"
	@user = @user.name 
	erb :"users/profile"
end 