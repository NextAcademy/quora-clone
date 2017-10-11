
get '/' do
  erb :"static/index"
end

post '/signup' do 
	user = User.new(params[:user])

	if user.save
		@message = "welcome aboard!!"
	else
		@message = "signup failed"
	end

	 erb :"static/index"
end

get '/sign_up' do
	erb :"static/sign_up"
end