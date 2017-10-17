get '/question' do
  erb :"question/new"
end

get '/question/show' do
  @question = Question.where(user_id: current_user.id)
  @count = @question.count
  erb :"question/my_question"
end


post '/question_create' do
  if session[:user_id]
    @question = Question.create(question_description: params[:question][:question_description], user_id: current_user.id)
    @message = "Your question has been posted!"
    redirect to 'question/show'
  else
    @message = "Please log in or sign up to post questions."
    redirect to '/'
  end
end


get '/question/:id/edit' do
  @question = Question.find(params[:id])
  erb :"question/edit"
end

patch '/question/:id/edit' do
  @question = Question.find(params[:id])
  if @question.update(params[:question])
    @message = "Question updated"
  redirect to '/question/show'
  end
end

get '/question/:id/delete' do
  @question = Question.find(params[:id])
  @question.destroy
  @message = "Question has been successfully deleted."
  redirect to '/question/show'
end