post '/answers' do
	# puts params
	# {"answer"=>{"title"=>"It's polite to greet people first", "user_id"=>"2", "question_id"=>"3"}, "captures"=>[]}

	answer = Answer.new(params[:answer])
	if answer.save
		redirect "/"
	else
		@answer_errors = answer.errors.messages
		erb :"static/index"
	end
end