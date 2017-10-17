# CREATE - NEW ANSWER OBJECT UNDER QUESTION AND CURRENT_USER
post '/questions/:question_id/answers/new' do

  @answer = Answer.new(params[:answer])
  @answer.question_id = params[:question_id]
  @answer.user_id = current_user.id 	#because only you can answer from your own account

  if @answer.save
    redirect "/questions/#{params[:question_id]}"
  else
    @errors = @answer.errors.full_messages.join(" ,")
    #capturing error messages thrown from validation tests under app/models/answer.rb
    # redirect "/users/#{current_user.id}"
  end

end

#READ - SHOW ALL MY ANSWERS
get '/answers' do
	@answer = current_user.answers
  erb :'answers/index'
end

#UPDATE - EDIT AN ANSWER
get '/answers/:id/edit' do
  @answer = Answer.find(params[:id])
  erb :"answers/edit"
end

post '/answers/:id' do
	@answer = Answer.find(params[:id])
  if @answer.update(params[:answer])
  	redirect "/answers"
  else
  	@errors = @answer.errors.full_messages.join(" ,")
  	erb :"answer/edit"
  end
end

#DELETE - DELETE AN ANSWER
get '/answers/:id/delete' do
  @answer = Answer.find(params[:id])
  @answer.destroy
  redirect "/answers"
end
