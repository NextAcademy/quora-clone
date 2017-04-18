enable :sessions

get '/users/:id/questions' do
  # some code here
  @user = User.find_by_id(params[:id])
  # erb :"static/question"
  erb :"questions/index"
end

post '/question' do
  question = Question.new(params[:question])
  question.user_id = current_user.id
  if question.save
    redirect '/'
  else
    flash[:msg] = "ERROR"
  end
end

get '/users/:id/question/:id' do
  @question = Question.find(params[:id])
  # erb :"static/question"
  erb :"questions/show"
end

# post '/question/:id/answer' do
#   @question = Question.find(params[:id])
#   answer = Answer.new(params[:answer])
#   answer.question_id = @question.id
#   answer.user_id = current_user.id
#   if answer.save
#     redirect '/question/#{params[:id]}'
#   else
#     "ERROR"
#   end
# end
