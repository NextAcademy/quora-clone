get '/' do
  erb :"static/index"
end

get '/signup' do
	erb :"static/sign_up"
end

get '/login' do
	if logged_in?
		redirect "/users/#{current_user.id}"
	else 
	 	erb :"static/login"
	 end
end