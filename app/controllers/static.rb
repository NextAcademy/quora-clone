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

get '/question' do
  @all_questions = Question.all
  erb :"static/profile"
end
