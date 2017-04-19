enable :sessions

post '/question/:id/answer' do
  @question = Question.find(params[:id])
  answer = Answer.new(params[:answer])
  answer.question_id = @question.id
  answer.user_id = current_user.id
  if answer.save
    redirect "/question/#{params[:id]}"
  else
    flash[:msg] = "ERROR"
  end
end

get '/users/:id/answers' do
  @user = User.find(params[:id])
  @answers = Answer.where(params[:id])
  erb :"questions/answers"
end

# get '/question/:id/answers' do
#   @question = Question.find_by_id(params[:id])
#   @answers = Answer.where(params[:id])
#   erb :"questions/index"
# end
 


