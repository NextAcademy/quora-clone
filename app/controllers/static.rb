enable :sessions

get '/' do
  erb :"static/index"
end

post '/signup' do
  @user = User.new(email:params[:email], password:params[:password], password_confirmation: false)

  if @user.save
    session[:user_id] = @user[:id]
    # direct the user to its profile page
    erb :'user_profile'
  else
    # return the error message
    @messages = @user.errors.messages
    erb :"static/index"

  end
end

post '/login' do
  @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
  if @user
    session[:user_id] = @user[:id]
    # direct to user profile page
    erb :'static/profile'
  else
    @messages = {login_error: ['wrong email or password']}
    erb :"static/index"
  end
end

post '/logout' do
  session = nil

  redirect '/'
end
