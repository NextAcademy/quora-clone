get '/' do
  erb :"static/index"
end

get '/profile' do
  if logged_in?
    erb :"static/profile"
  end
end

post '/user' do
  user = User.new(params[:user])
  if user.save
    redirect '/'
  else
    p user.errors
  end
end

post '/login' do
  user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
  if user
    session[:current_user_id] = user.id
    redirect "/profile"
  else
    p "check password or email"
  end
end

post '/logout' do
  session[:current_user_id] = nil
  redirect '/'
end

post '/question' do
  question = Question.new(params[:question])
  if question.save
    redirect '/profile'
  else
    p "hello you not input the title of question"
  end
end

get '/user/:id/question' do
  @all_user_questions = Question.where(user_id: params[:id])
  erb :"static/profile"
end

get '/user/:user_id/question/:question_id' do
  @question = Question.find(params[:question_id])
  @answers = @question.answers
  erb :"static/profile"
end

get '/question' do
  @all_questions = Question.all
  erb :"static/profile"
end

post '/answer' do
  answer = Answer.new(params[:answer])
  if answer.save
    erb :"static/profile"
  else
    p "errors"
  end
end

post '/upvote' do
  upvote = QuestionVote.find_or_initialize_by(params[:upvote])
  if upvote.id
    upvote.question.downvote_question
    upvote.destroy
    redirect '/profile'
  elsif upvote.save
    upvote.question.upvote_question
    erb :"static/profile"
  else
    redirect '/profile'
  end
end

post '/downvote' do
  downvote = QuestionVote.new(params[:downvote])
  if downvote.save
    downvote.question.downvote_question
    erb :"static/profile"
  end
end
