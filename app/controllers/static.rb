get '/' do
  if !logged_in?
    erb :"static/landing"
  else
    @questions = list_all_questions
    erb :"question/index"
  end

end

get '/index' do
  @questions = list_all_questions
  erb :"static/index"
end

