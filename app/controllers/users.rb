get '/users/new' do
	erb :'users/new'
end

post '/users' do
	user = User.new(email: params[:email], username: params[:username], password: params[:password])
	user.save
	if user.save
		redirect '/signup/success'
	else
		redirect '/signup/failure'
	end
end

get '/signup/success' do
	erb :'static/signup-success'
end

get '/signup/failure' do
	erb :'static/signup-failure'
end