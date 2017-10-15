#CREATE - MAKE A QUESTION OBJECT
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

#READ - SHOW A QUESTION WITH ITS ANSWERS
get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :"questions/show"
end

#READ - SHOW ALL QUESTIONS
get '/questions' do
  erb :'questions/index'
end

