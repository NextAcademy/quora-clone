enable :sessions
set :session_secret, "My session secret"

# get form for user to ask question
get '/questions/new' do
  erb :"static/ask"
end

# create the question user asks
post '/questions' do
  params[:question][:user_id] = current_user.id
  question = Question.new(params[:question])
  if question.save
    return question.to_json
    # flash[:msg] = "Question posted successfully"
    # redirect '/questions/'+ current_user.id.to_s
  else
    flash[:error] = user.errors.full_messages.join('. ')
    redirect '/questions/new'
  end
end

# show particular user's questions
get '/questions/:id' do
  @questions = Question.where(user_id: params[:id]).order('created_at desc')
  if @questions.length == 0
    flash[:msg] = "You have no question."
    redirect '/'
  else
    erb :"static/questions"
  end
end

# show all questions
get '/questions' do
  @questions = Question.order('created_at desc')
  erb :"static/all_questions"
end

# delete particular question
delete '/questions/:id' do
  questions = Question.find(params[:id])
  questions.delete
  redirect '/questions/'+ current_user.id.to_s
end
