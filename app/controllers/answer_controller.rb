enable :sessions

post '/question/:id/answer' do
  @question = Question.find(params[:id])
  answer = Answer.new(params[:answer])
  answer.question_id = @question.id
  answer.user_id = current_user.id
  if answer.save
    redirect '/question/#{params[:id]}'
  else
    flash[:msg] = "ERROR"
  end
end

get '/question/:id/answers' do
  @question = Question.find(params[:id])
  erb :"questions/index"
end
 
get '/question/:q_id/answer/:a_id' do
  @question = Question.find(params[:q_id])
  erb :"questions/show"
end

