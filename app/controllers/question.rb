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
    @question.errors.messages.to_json
  end
end

get '/questions/index' do
  @questions = Question.all.order(:id).reverse_order

  erb :'question/index'
end

get '/questions/:id' do
  @question = Question.find_by_id(params[:id])
  erb :"question/question"

end