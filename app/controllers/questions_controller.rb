
get '/users/:id/questions' do
  @user = User.find(params[:id])
  @questions = @user.questions
  erb :"questions/index"
end


get '/questions/new' do
  erb :"questions/new"
end


post "/questions" do
  @question = Question.new(title: params[:question][:title], question_text: params[:question][:question_text], user_id: current_user.id)
  if @question.save
    redirect "/users/#{@current_user.id}/questions"
  else
    redirect "/questions/new"
  end

end


get "/questions/:id" do
  @question_show = Question.find(params[:id])
  @question_showq
  erb :"questions/show"
end


delete "/users/:user_id/questions/:id" do
  @question_destroy = Question.find(params[:id])
  @question_destroy.destroy
  redirect "/users/#{params[:user_id]}/questions"
end
