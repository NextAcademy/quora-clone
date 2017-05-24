get '/' do
  @question = Question.all.order('created_at DESC')
  @answer = Answer.all.order('created_at DESC')
  if session[:user_id] != nil
    erb :"/home"
  else
    erb :"users/login"
  end
end

get '/questions' do
  @question = Question.all.order('created_at DESC')
  @answer = Answer.all.order('created_at DESC')
  erb :"/questions"
end
