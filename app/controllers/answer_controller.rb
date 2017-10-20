# C - CREATE AN ANSWER FOR PARTICULAR QUESTION
post '/question/:question_id/answers/new' do
	
	@answer = Answer.new(params[:answer])
	@answer.question_id = params[:question_id]
	@answer.user_id = current_user.id

	if @answer.save
		redirect "/question/#{params[:question_id]}"
	else
		@errors = @answer.errors.full_messages.join(" ,")
	end
end

#R - SHOW ALL ANSWERS
get '/answers' do
	@answer = current_user.answers
  erb :'answers/index'
end

#UPDATE - UPDATE AN ANSWER
get '/answers/:id/edit' do
  @answer = Answer.find(params[:id])
  erb :"answers/edit"
end

put '/answers/:id' do
  @answer = Answer.find(params[:id])
  if @answer.update(params[:answer])
    redirect to "/answers"
  else
    @errors = @answer.errors.full_messages.join(" ,")
    erb :"answers/edit"
  end
end

#DELETE - DELETE AN ANSWER
get '/answers/:id/delete' do
  @answer = Answer.find(params[:id])
  @answer.destroy
  redirect "/answers"
end

get '/answers/:id/edit' do
  @answer = Answer.find(params[:id])
  erb :"answers/edit"
end

post '/answers/:id' do
  @answer = Answer.find(params[:id])
  if @answer.update(params[:answer])
    redirect "/answer/#{@answer.id}"
  else
    @errors = @answer.errors.full_messages.join(" ,")
    erb :"answers/edit"
  end
end

#DELETE - DELETE AN ANSWER
delete '/answers/:id/delete' do
  @answer = Answer.find(params[:id])
  @answer.destroy
  redirect "/answers"
end
