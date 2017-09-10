post '/questions/submit_question' do

  @question = Question.new
  erb :"static/session"

end