
# CREATE - CREATE
post '/signup' do
  user = User.new(params[:user])
  if user.save
  	redirect "/users/#{user.id}"
  else
  	# what should happen if the user keyed in invalid data?
  	redirect '/'
  end
end


#READ - SHOW
get '/users/:id' do
	@user = User.find(params[:id])

	erb :"users/show"

end

#READ QUESTIONS OF SPECIFIC USER
get '/users/:id/questions' do
  @user= User.find(params[:id])
  @question= Question.find(params[:id])
  erb :"users/myquestions"

end



#READ ANSWERS OF SPECIFIC USER
get '/users/:id/answers' do
  @user = User.find(params[:id])

  # Get all the answers that are written by the user
  @answers = Answer.where(user_id: @user.id)

  # Get the questions for the answers
  @questions = Hash.new
  @answers.each do |a|
    @questions[a.question.id] = a.question
  end

  erb :"users/myanswers"
end