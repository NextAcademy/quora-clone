get '/' do
  erb :"static/index"
end

get '/signup' do 
	erb :"static/signup"
end

post '/createuser' do 
	if params[:password] == params[:retype]
	User.create(name: params[:name2], password: params[:password])
	else 
		redirect '/signup'
	end
		redirect '/'
end	

get '/login' do 
	@user = User.find_by_name(params[:name1])
	if @user != nil && @user.authenticate(params[:password])
			redirect '/id'
		else
		redirect '/'
	end
end

get '/:id' do
	@user
	erb :"static/id"
end




