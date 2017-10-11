get '/' do
  erb :"users/login"
end


get '/signup' do 
	erb :"users/signup"
end

post '/new' do 
	newuser = User.new(params[:user])
	newuser.save
	if newuser.save
		
		@error = "you may now log in"
		redirect '/'
	else
		@error = "please try again"
		redirect "/signup"
	end
end

post '/login' do
 	user = User.find_by(params[:user])
 	if params[:user][:password_digest] = user.password_digest
 		redirect '/user/#{user.id}'
 	else
 		@error = "invalid username/password"
 		redirect '/'
 	end
end

post '/logout' do 
	redirect = '/'
end

get '/user/:id' do
	redirect = '/'
end