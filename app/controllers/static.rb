enable :sessions

get '/' do
  erb :"static/index"
end

get '/sessions/new' do
	erb :"static/login"
end

get '/users/new' do
	erb :"static/signup"
end

delete '/sessions/:id' do
	session[:id] = nil
	erb :"static/index"
end


post '/users' do
  user = User.new(params[:user])
	if user.save
		session[:id] = user.id
		redirect "user_profile/#{user.id}"
	else
		@errors = user.errors.full_messages
		erb :'static/login'
		#Display errors on page
	end
end

post '/sessions' do
	user = User.find_by(email: params[:user][:email])
	if user.nil?
		@errors = ["Sorry, we don't have an account with the email address '#{params[:user][:email]}'."]
		erb :'static/login'
	else
		if user.authenticate(params[:user][:password])   
			session[:id] = user.id
			p current_user
			redirect "users/#{user.id}"
		else
			@errors = ["Hi #{user.first_name}, unfortunately the password that you entered is incorrect."]
			erb :'static/login'
		end
	end
end


get "/users/:id" do
	if current_user && current_user.id == params[:id].to_i
		id = params[:id]
		@user = User.find(id)
		erb :"users/profile"
	else
		redirect "/login"
	end
end