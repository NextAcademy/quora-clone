post '/questions' do
	@question = current_user.questions.new(params[:question])
	if @question.save

	else
		
	end

end