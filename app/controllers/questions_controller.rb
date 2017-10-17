get '/question/:id/answer' do
	@question= Question.find(params[:id])
	erb :"static/answer"
end

post '/question/:id/answer' do
	answer= Answer.new(user_id:current_user.id, question_id: params[:id], qualifications: params[:qualifications], body: params[:answer])
	answer.save
	redirect '/homepage'
end


