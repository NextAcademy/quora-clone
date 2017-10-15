# Not actually necessary, just if someone is poking at the javascript
# and they see that we're sending stuff to '/askquestion' this will
# redirect them to the main page
get '/askquestion' do
  redirect '/'
end

post '/askquestion' do
  # Should add validation

  begin 
    raise('Not logged in') if !logged_in?
    question = Question.new(user_id: session[:user_id], content: params[:content])
    createSucess = question.save
    raise('Malformed post') if !createSucess
    'Success'
  rescue Exception => err
    status(400)
    body("Error: #{err.message}")
  end
end

get('/question/:id') do
  @question = Question.find(params[:id])
  if @question
    erb :'users/q_and_a', layout: :'layouts/userpage'
  else
    @error = 'reeee'
  end
end

post('/delete') do
  id, type = params[:args].split(',')
  begin
    raise('You must be logged in to delete') if !logged_in? 
    case (type)
    when 'answer'
      # begin
      answer = Answer.find(id)
      if session[:user_id] == answer.user.id
        answer.delete
        answer.save
      else
        raise('You cannot delete posts by another user.')
      end
      'Success'
    when 'question'
    else
      raise('Invalid type')
    end
  rescue Exception => err
    status(400)
    body("Error: #{err.message}")
  end
end

post('/answer') do
  begin
    raise('Not logged in') if (!logged_in?)
    # Question.find raises an exception if invalidId
    question = Question.find(params[:question_id])
    answer = Answer.new(user_id: session[:user_id], question_id: question.id,
      content: params[:content])
    update = answer.save
    raise('Malformed post') if !update
    'Success'
  rescue Exception => err
    status(400)
    body("Error: #{err.message}")
  end
end


HITS_PER_PAGE = 10

# remove this route as main page will link here
get '/main' do
  erb :'users/show', layout: :'layouts/userpage'
end