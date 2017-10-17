
post '/answer_create' do
	@answer = Answer.create(answer_description: params[:answer][:answer_description], user_id: current_user.id, question_id: params[:answer][:question_id])
	@message = "Your answer has been posted!"
	redirect '/main'
end

get '/answer/show' do
	@answer = Answer.where(user_id: current_user.id)
    @count = @answer.count
	erb :"answer/my_answer"
end

get '/answer/:id/edit' do
  @answer = Answer.find(params[:id])
  erb :"answer/edit"
end

patch '/answer/:id/edit' do
  @answer = Answer.find(params[:id])
  if @answer.update(params[:answer])
    @message = "Answer updated"
  redirect to '/answer/show'
  end
end

get '/answer/:id/delete' do
  @answer = Answer.find(params[:id])
  @answer.destroy
  @message = "answer has been successfully deleted."
  redirect to '/answer/show'
end