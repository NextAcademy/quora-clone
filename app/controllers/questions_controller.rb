post '/questions' do
	# puts params
	# {"question"=>{"title"=>"What question should I ask?", "user_id"=>"2"}, "captures"=>[]}
	question = Question.new(params[:question])
	if question.save
		redirect "/"
	else
		@question_errors = question.errors.messages
		erb :"static/index"
	end
end