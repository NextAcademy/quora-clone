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

get '/questions/:id' do
	# puts params
	# {"captures"=>[], "id"=>"3"}
	@question = Question.find_by_id(params[:id])
	@title = @question.title + " - Quora Clone"
	@answers = Answer.where(question_id: @question.id).order(created_at: :desc)
	@user = User.all
	@question_votes = QuestionVote.where(question_id: @question.id).sum(:vote)
	erb :"static/question"
end