get '/' do
  if logged_in?
    erb :"static/profile"
  else
    erb :"static/index"
  end
end

get '/profile' do
  if logged_in?
    erb :"static/profile"
  end
end

get '/question' do
  @all_questions = Question.all
  erb :"static/questions"
end

get '/user/:id/question' do
  @all_user_questions = Question.where(user_id: params[:id])
  erb :"static/profile"
end

get '/user/:user_id/question/:question_id' do
  @question = Question.find(params[:question_id])
  @answers = @question.answers
  erb :"static/question_answers"
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

post '/answer' do
  answer = Answer.new(params[:answer])
  if answer.save
    erb :"static/profile"
  else
    p "errors"
  end
end

post '/question_upvote' do
  upvote = QuestionVote.find_or_initialize_by(params[:upvote])
  if upvote.id
    upvote.question.downvote_question
    upvote.destroy
    redirect '/question'
  elsif upvote.save
    upvote.question.upvote_question
    redirect '/question'
  else
    redirect '/question'
  end
end

post '/question_downvote' do
  downvote = QuestionVote.find_or_initialize_by(params[:downvote])
  if downvote.id
    downvote.question.upvote_question
    downvote.destroy
    redirect '/question'
  elsif downvote.save
    downvote.question.downvote_question
    redirect '/question'
  else
    redirect '/question'
  end
end

post '/answer_upvote' do
  upvote = AnswerVote.find_or_initialize_by(params[:upvote])
  if upvote.id
    upvote.answer.downvote_answer
    upvote.destroy
    redirect '/profile'
  elsif upvote.save
    upvote.answer.upvote_answer
    erb :"static/profile"
  else
    redirect '/profile'
  end
end

post '/answer_downvote' do
  downvote = AnswerVote.find_or_initialize_by(params[:downvote])
  if downvote.id
    downvote.answer.upvote_answer
    downvote.destroy
    redirect '/profile'
  elsif downvote.save
    downvote.answer.downvote_answer
    erb :"static/profile"
  else
    redirect '/profile'
  end
end
