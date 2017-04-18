get '/question/new' do
    erb :'question/new'
end

post '/question/new' do
    question = Question.new(params[:question])
    question.user_id = current_user.id
    if question.save
        "<h1>Created!</h1>"
        redirect '/questions'
    else
        "<h1> error </h1>"
    end
end

get '/questions' do
    erb :"question/index"
end
