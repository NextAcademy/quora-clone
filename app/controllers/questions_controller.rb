post '/questions' do
	# Do something processing with user input

	i = Question.new(params[:question])

	# i.update(question_votes:x.question_vote)
	@user = current_user
	if i.save
		x = QuestionVote.new(user_id:current_user.id, question_id:i.id)
		x.save
		# i.to_json
		# {success: true, message: i}.to_json
		# p @current_user
		erb :"users/show"	
		# redirect "/questions/#{current_user.id}"
	else
		# @errors = i.errors.messages
		# {success: false, message: (i.errors.messages)}.to_json
		redirect '/users/:id'
	end

end

get "/questions/:id" do
	id = params[:id]
	@user = User.find(id)

	if session[:user_id] == @user.id
		erb :"questions/show"	
	else
		redirect '/'
	end
end

get '/question/user/:id' do
	redirect "/users/#{current_user.id}"
end

get '/quora_questions' do
	erb :"questions/index"
end
