post '/question' do
  question = Question.new(content: params[:content], user_id: current_user.id)
  if question.save
    redirect '/'
  else
    @question = Question.all.order('created_at DESC')
    erb :"homefail"
  end
end

get "/question/:id" do
  @question = Question.find_by_id(params[:id])
  @answer = Answer.all.order('created_at DESC')
  erb :"question"
end

get "/question/:id/edit" do
  @question = Question.find_by_id(params[:id])
  erb :"editquestion"
end

patch "/question/:id" do
  @question = Question.find_by_id(params[:id])
  @question.content = params[:content]
  @question.save
  redirect "/profile/#{current_user.id}"
end

delete "/question/:id" do
  @question = Question.find_by_id(params[:id])
  @question.destroy
  redirect "/profile/#{current_user.id}"
end
