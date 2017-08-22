get '/' do
  	erb :"static/index"
end

get '/user/new' do
  	erb :"users/signup"
end

post '/user' do
	user = User.new(params[:user])
	if user.save
		session[:id] = user.id
		redirect "/user"
	else
		@user = user
		erb :"users/signup"
	end
end

get '/user/signin' do
	erb :"users/signin"
end

post '/user/signin' do
	user = User.find_by(email: params[:email])
	if user.nil?
		@error = "Wrong email!"
		erb :"users/signin"
	else
		login = user.authenticate(params[:password])
		if login == false
			@error = "Wrong password!"
			erb :"users/signin"
		else
			session[:id] = user.id
			redirect "/user"
		end
	end
end

get '/user/signout' do
	session.clear
	redirect '/'
end

get '/user' do
	erb :"users/profile"
end