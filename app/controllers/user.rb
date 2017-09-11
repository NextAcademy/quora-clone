post '/users/signup' do
  @user = User.new(user_id:params[:email], password:params[:password], password_confirmation: false)
  if @user.save
    session[:user_id] = @user[:id]
    redirect "/users/#{@user[:id]}"
  else
    # return the error message
    @messages = @user.errors.messages
    erb :"static/landing"

  end
end

post '/users/login' do
  @user = User.find_by(user_id: params[:email]).try(:authenticate, params[:password])
  if @user
    session[:user_id] = @user[:id]
    redirect "/questions/index"
  else
    @messages = {Invalid_login: ['Wrong username or password']}
    erb :"static/landing"
  end
end

get '/users/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/users/:id' do
  if logged_in?
    @user = User.find_by_id(params[:id])
    erb :"user/profile"
  else
    erb :"static/landing"
  end
end

get '/users/:id/questions' do
  if logged_in?
    user = User.find_by_id(params[:id])
    questions = user.questions.order(:id).reverse_order

    if !questions.nil?
      response = Array.new
      questions.each do |ques|
        response << ques.attributes
      end
      return response.to_json
    end

  else
    erb :"static/landing"
  end
end

get '/users/:id/answers' do
  if logged_in?
    user = User.find_by_id(params[:id])
    answers = user.answers.order(:id).reverse_order

    if !answers.nil?
      response = Array.new
      answers.each do |ans|
        response << ans.attributes
      end
      return response.to_json
    end

  else
    erb :"static/landing"
  end
end