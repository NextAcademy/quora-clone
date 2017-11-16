post '/sessions' do 
	if user = User.find_by(user_email: params[:email])
		if user.authenticate(params[:password])
			session[:user_id] = user.id
		 	erb :'/static/users/userloggedin'
		else 
		 	erb :'/static/users/new'
		end 
	else 
		erb :'/static/users/new'
	end 
end 

get '/logout' do 
	session[:user_id]= nil
	erb :'static/mainpage'
end 

