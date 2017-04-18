
#returns a new HTML question form
get '/questions/new' do
  erb :'questions/new'
end

#create a new question
post '/questions' do
  @question = Question.new(params[:question])
  @question.user_id = current_user.id
    if @question.save
      flash[:msg] = "Succesfully submitted question"
      redirect '/questions'
    else
      flash[:msg] = @question.errors.full_messages.join(',')
      redirect '/questions/new'
    end
end

#display a list of questions
get '/questions' do
  @question = Question.all
  erb :'questions/index'
end

#display a specific question
get '/questions/:id' do
  @question = Question.find_by id: params[:id]
  erb :'questions/show'
end

#return an HTML form for editing a question
get '/questions/:id/edit' do

end

#update a specific question
put '/questions/:id' do

end

#delete a specific question
delete '/questions/:id' do

end
