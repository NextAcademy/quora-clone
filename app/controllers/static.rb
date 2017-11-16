get '/' do
  erb :"static/index"
end

get '/signup' do
	erb :"users/new"
end

post '/signup' do
	# Do something processing with user input
	i = User.new(ori_url:params[:long_url], short_url: Url.shorten)

	if i.save
		i.to_json
		# redirect '/'
		{success: true, message: i}.to_json
	else
		@errors = i.errors.messages
		{success: false, message: (i.errors.messages)}.to_json
		# erb :'static/index'
	end

	redirect to '/user/dashboard'
end

get '/user/dashboard' do
	erb :dashboard
end