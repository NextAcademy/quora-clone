enable :sessions

get '/' do
  if logged_in?
    erb :"static/index"
  else
    erb :"static/landing"
  end
end

post '/signup' do
  @user = User.new(email:params[:email], password:params[:password], password_confirmation: false)

  if @user.save
    session[:user_id] = @user[:id]
    redirect '/'
  else
    # return the error message
    @messages = @user.errors.messages
    erb :"static/landing"

  end
end

post '/login' do
  @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
  if @user
    session[:user_id] = @user[:id]
    redirect '/'
  else
    @messages = {login_error: ['wrong email or password']}
    erb :"static/landing"
  end
end

get '/logout' do
  session = nil

  redirect '/'
end

