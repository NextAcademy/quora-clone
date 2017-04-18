get '/question/new' do
  erb :"static/new"
end

post '/question/create' do
  puts "HERE"
  question = Question.new(params[:question])
  question.user_id = current_user.id
  if question.save
    redirect "/"
  else
    flash[:msg] = "ERROR"
  end
end

get '/question/:id' do
  @question = Question.find(params[:id])
  erb :"static/index"
end

post '/question/:id/answer' do
  @question = Question.find(params[:id])
  answer = Answer.new(params[:answer])
  answer.question_id = @question.id
  answer.user_id = current_user.id
  if answer.save
    redirect '/question/#{params[:id]}'
  else
    "ERROR"
  end
end
