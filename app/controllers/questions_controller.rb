post '/questions' do
  question = Question.new(question: params[:question], user_id:params[:user_id])
  if question.save
    @questions = Question.all
    erb :"static/home"
  else
    @errors = question.errors.messages
    erb :"static/home"
  end
end
