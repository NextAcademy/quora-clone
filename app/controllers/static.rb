get '/' do
  @users = User.all

  if logged_in?
    @questions = Question.all
    erb :"static/home"
  else
    erb :"static/index"
  end
end
