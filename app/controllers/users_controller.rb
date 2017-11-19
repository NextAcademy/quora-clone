get '/users/new' do
	erb :"users/new"
end

post '/users' do
	# Do something processing with user input

	i = User.new(params[:user])
	if i.save
		# i.to_json
		# {success: true, message: i}.to_json
		session[:user_id] = i.id
		redirect "/users/#{i.id}"
	else
		# @errors = i.errors.messages
		# {success: false, message: (i.errors.messages)}.to_json
		redirect '/'
	end

end

get '/users/:id' do
	id = params[:id]
	@user = User.find(id)
	# @question = Question.find_by(user_id:id)
	if session[:user_id] == @user.id  #|| @question.user_id
		erb :"users/show"	
	else
		redirect '/'
	end
end

