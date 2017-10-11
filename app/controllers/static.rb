get '/' do
  erb :"users/login"
end


get '/signup' do 
	erb :"users/signup"
end

post '/new' do 
	newuser = User.new(params[:user])

	if newuser.save
		
		@error = "you may now log in"
		 erb :"users/login"
	else
		@error = "please try again"
		redirect "/signup"
	end
end

post '/login' do
 	user = User.find_by(email: params[:user][:email])
 	# if params[:user][:password_digest] = user.password_digest
 	if user && user.authenticate(params[:user][:password])
 		session[:user_id] = user.id
 		redirect "/user/#{user.id}"
 	else
 		@error = "invalid username/password"
 		 erb :"users/login"
 	end
end

post '/logout' do 
	session[:user_id] = nil
	redirect '/'
end

get '/user/:id' do
	if 
		erb :"users/show", { layout: :"layouts/userpage" }
	end
end