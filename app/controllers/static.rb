get '/' do
  erb :"static/index"
end


get '/login' do
	if logged_in?
		redirect "/users/#{current_user.id}"
	else 
	 	erb :"static/login"
	 end
 end 