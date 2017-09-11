post '/questions/create' do
  @question = Question.new
  @question[:user_id] = session[:user_id]
  @question[:header] = params[:questionHeader]
  @question[:detail] = params[:questionDetail]

  if @question.save
    # redirect '/questions/index'
    response = @question.attributes
    response[:user] = @question.user[:user_id]
    response.to_json
  else
    error_msg = flag_error_msg(@question.errors.messages)
    error_msg.to_json
  end
end

get '/questions/index' do
  @questions = Question.all.order(:id).reverse_order

  erb :'question/index'
end

get '/questions/:id' do
  @question = Question.find_by_id(params[:id])
  @answers = @question.answers
  erb :"question/question"

end

post '/questions/:id/answers/create' do

  if Question.find_by_id(params[:id])[:user_id] == session[:user_id]
    return {"error"=> ["You can't answer your own question!"]}.to_json
  end

  if !Answer.find_by(user_id:session[:user_id]).nil?
    return {"error"=>["You have already answered to this question!"]}.to_json
  end

  answer = Answer.new
  answer[:question_id] = params[:id]
  answer[:user_id] = session[:user_id]
  answer[:detail] = params[:answer]

  if answer.save
    response = answer.attributes
    response[:user] = answer.user[:user_id]
    response.to_json
  else
    error_msg = flag_error_msg(answer.errors.messages)
    error_msg.to_json
  end
end