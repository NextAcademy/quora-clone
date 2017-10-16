

post '/question' do
  question = Question.new(question_content: params[:question_content], user_id: current_user.id)
  if question.save
    redirect '/home'
  else
    @question_error = question.errors.messages.values.join(',')
    erb :"/static/home"
  end
end
