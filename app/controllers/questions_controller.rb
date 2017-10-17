#CREATE - NEW QUESTION OBJECT
post '/questions' do
	#@user = @question.user
	@question = current_user.questions.new(params[:question])

	if @question.save
		redirect "/questions/#{@question.id}"
	else
		@errors = @question.errors.full_messages.join(" ,") #capturing error messages thrown from validation tests under app/models/question.rb
    redirect "/users/#{current_user.id}"
	end
end

#READ - SHOW A QUESTION WITH ANSWERS
get '/questions/:id' do

  @question = Question.find(params[:id])
  @questions = current_user.questions
  erb :"questions/show"
end

#READ - SHOW ALL MY QUESTIONS
get '/questions' do
	# @question = Question.find_by(user_id: current_user.id)
	@question = current_user.questions
  erb :"questions/index"
end

#UPDATE - EDIT A QUESTION
get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :"questions/edit"
end

post '/questions/:id' do
	@question = Question.find(params[:id])
  if @question.update(params[:question])
  	redirect "/questions/#{@question.id}"
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