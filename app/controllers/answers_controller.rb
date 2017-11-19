get '/:id' do
	id = params[:id]
	@question = Question.find(id)
	# @question = Question.find_by(user_id:id)
	erb :"answers/show"
end

# get "/answers/show" do
# 	erb :"answers/show"
# end 

post '/answers' do #fix this @question
	# Do something processing with user input
	# id = params[:id]
	
	i = Answer.new(params[:answer])
	i.save
	@question = Question.find(i.question_id)
	erb :"answers/show"
	# if i.save
	# 	# @question = Question.find(id)
	# 	# i.to_json
	# 	# {success: true, message: i}.to_json
	# 	# redirect "/questions/#{current_user.id}"
	# 	redirect '/:id'
	# else
	# 	# @errors = i.errors.messages
	# 	# {success: false, message: (i.errors.messages)}.to_json
	# 	redirect '/users/:id'
	# end

end