enable :sessions

post '/question' do
  question = Question.new(params[:question])
  question.user_id = current_user.id
  if question.save
    redirect '/'
  else
    flash[:msg] = "ERROR"
  end
end

get '/question/:id' do
  @question = Question.find(params[:id])
  #@questions = Question.paginate(:page => params[:page]).order('id DESC') 
  erb :"/questions/show"
end

get '/users/:id/questions' do
  @user = User.find_by_id(params[:id])
  #@users = Post.paginate(:page => params[:page])
  
  erb :"questions/index"
end


