enable :sessions

get '/' do
  erb :"static/index"
end

post '/sign_in_page' do
	erb :"static/login"
end

post '/logout' do
	session[:user_id] = nil
	erb :"static/index"
end


post '/signup' do
  user = User.new(params[:user])
	if user.save
		session[:user_id] = user.id
		redirect "user_profile/#{user.id}"
	else
		@errors = user.errors.full_messages
		erb :'static/login'
		#Display errors on page
	end
end

post '/login' do
	if User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
		session[:user_id] = user.id
		p current_user
		redirect "user_profile/#{user.id}"
	else
		@errors = ["Invalid email/password"]
		erb :'static/login'
		#Display errors on page
	end
end


get "/user_profile/:id" do
	if current_user && current_user.id == params[:id].to_i
		id = params[:id]
		@user = User.find(id)
		erb :"users/profile"
	else
		redirect "/"
	end
end