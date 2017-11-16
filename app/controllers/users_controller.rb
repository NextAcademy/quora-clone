get '/users/new' do
	erb :"users/new"
end

post '/users' do
	# Do something processing with user input

	i = User.new(params[:user])
	if i.save
		# i.to_json
		# {success: true, message: i}.to_json
		redirect "/user/#{i.id}"
	else
		# @errors = i.errors.messages
		# {success: false, message: (i.errors.messages)}.to_json
		redirect '/'
	end

end

get '/user/:id' do
	id = params[:id]
	@user = User.find(id)
	if session[:user_id] == @user.id
		erb :"users/show"	
	else
		redirect '/'
	end
end

