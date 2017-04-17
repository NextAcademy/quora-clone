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
		redirect "user_profile/#{user.id}"
	else
		erb :'static/login'
		#Display errors on page
	end
end

post '/login' do
	user = User.find_by(email: params[:user][:email])
	if user.authenticate(params[:user][:password])
		session[:user_id] = user.id
		p current_user
		redirect "user_profile/#{user.id}"
	else
		erb :'static/login'
		#Display errors on page
	end
end


get "/user_profile/:id" do
	id = params[:id]
	@user = User.find(id)
	erb :"users/profile"
end