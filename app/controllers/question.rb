# Page Loading
get('/question/:id') do
  @question = Question.find(params[:id])
  if @question
    erb(:'users/q_and_a', layout: :'layouts/userpage')
  else
    @error = 'reeee'
  end
end


# API Requests
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

post('/delete') do
  id, type = params[:args].split(',') # two arguments passed csv
  begin
    raise('You must be logged in to delete') if !logged_in?

    # Deleting either answer or question
    case (type)
    when 'answer'
      answer = Answer.find(id)
      questionId = answer.question.id
      if session[:user_id] == answer.user.id
        answer.delete
        answer.save
      else
        raise('You cannot delete posts by another user.')
      end

      # Then refresh the answers
      displayAllAnswers(Question.find(questionId))
        
    when 'question'
      raise('Not implemented yet')
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
    question = Question.find(params[:args])
    answer = Answer.new(user_id: session[:user_id], question_id: question.id,
      content: params[:content])
    update = answer.save
    raise('Malformed post') if !update
    displayAllAnswers(Question.find(params[:args]))    
  rescue Exception => err
    status(400)
    body("Error: #{err.message}")
  end
end


post('/lastestquestions') do
  begin
    raise('Not logged in') if (!logged_in?)
    # Question.find raises an exception if invalidId
    question = Question.find(params[:args])
    answer = Answer.new(user_id: session[:user_id], question_id: question.id,
      content: params[:content])
    update = answer.save
    raise('Malformed post') if !update
    displayAllAnswers(Question.find(params[:args]))    
  rescue Exception => err
    status(400)
    body("Error: #{err.message}")
  end
end

# Need to put this in show.erb
HITS_PER_PAGE = 10