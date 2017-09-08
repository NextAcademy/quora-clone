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
  end

end