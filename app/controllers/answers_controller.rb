post "/answer" do
  @question = Question.find_by_id(params[:question_id])
  @answer = Answer.all.order('created_at DESC')
  answer = Answer.new(answer: params[:answer], user_id: current_user.id, question_id: params[:question_id])
  if answer.save
    redirect "/question/#{@question.id}"
  else
    erb :"answerfail"
  end
end

get "/answer/:id/edit" do
  @question = Question.find_by_id(params[:question_id])
  @answer = Answer.find_by_id(params[:id])
  erb :"editanswer"
end

patch "/answer/:id" do
  @answer = Answer.find_by_id(params[:id])
  @answer.answer = params[:content]
  @answer.save
  redirect "/profile/#{current_user.id}"
end

delete "/answer/:id" do
  @answer = Answer.find_by_id(params[:id])
  @answer.destroy
  redirect "/profile/#{current_user.id}"
end
