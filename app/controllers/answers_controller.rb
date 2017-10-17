get '/questions/:id/answers' do
	@question= Question.find(params[:id])
	@answer= @question.answers

	erb :"static/singleqanda"
end