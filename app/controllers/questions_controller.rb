# C - CREATE NEW QUESTION
post '/questions' do
  #if my helper has a current_user method that can return me who's the current log in user object

  @question = current_user.questions.new(question_description: params[:description])
  # by linking current_user.questions, i can save in the current logged in user id into my question object
  # automatically simply because their 1-many relationship has been established

  if @question.save
    redirect "/question/#{@question.id}"
  else
    @errors = @question.errors.full_messages.join(" ,") #capturing error messages thrown from validation tests udner app/models/question.rb
    redirect "/"
  end

end

# R - DISPLAY A LIST OF ALL QUESTIONS FOR A SPECIFIC USER
get '/questions' do
  @question_all = Question.all
  # @question = Question.find(params[:id])
  erb :"questions/index"
end

#R- SHOW A QUESTION WITH ANSWER
get '/question/:id' do
  @question = Question.find(params[:id])
  erb :"questions/show"
end

#UPDATE - UPDATE A QUESTION
get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :"questions/edit"
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  if @question.update(params[:question])
    redirect "/question/#{@question.id}"
  else
    @errors = @question.errors.full_messages.join(" ,")
    erb :"questions/edit"
  end
end

#DELETE - DELETE A QUESTION
get '/questions/:id/delete' do
  @question = Question.find(params[:id])
  @question.destroy
  redirect "/questions"
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :"questions/edit"
end

post '/questions/:id' do
  @question = Question.find(params[:id])
  if @question.update(params[:question])
    redirect "/question/#{@question.id}"
  else
    @errors = @question.errors.full_messages.join(" ,")
    erb :"questions/edit"
  end
end

#DELETE - DELETE A QUESTION
delete '/questions/:id/delete' do
  @question = Question.find(params[:id])
  @question.destroy
  redirect "/questions"
end
