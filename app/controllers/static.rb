enable :sessions
set :session_secret, "My session secret"

get '/' do
  session[:user_id] = nil
  if logged_in?
    redirect '/profile'
  else
    erb :"static/index"
  end
end

get '/login' do
  session[:user_id] = nil
  erb :"static/login"
end

get '/profile' do
  erb :"static/profile"
end

get '/users/:id' do
  # some code here
  @user = User.find_by_id(params[:id])
  if @user != nil
    if logged_in? && current_user.id == params[:id].to_i
      erb :"static/profile"
    elsif logged_in?
      redirect '/users/' + current_user.id.to_s
    else
      redirect '/'
    end
  else
    redirect '/'
  end
end

post '/signup' do
  user = User.new(params[:user])
  if user.save
    flash[:msg] = "Account created successfully"
    redirect '/'
  else
    flash[:msg] = user.errors.full_messages.join('. ')
    redirect '/'
  end
end

post '/login' do
  user = User.find_by(email: params[:user][:email])
  if user != nil
    if !user.authenticate(params[:user][:password])
      flash[:error] = "Invalid password"
      redirect '/login'
    else
      # if log in successfully, store in session
      flash[:msg] = "Login Successfully"
      session[:user_id] = user.id
      redirect '/users/' + user.id.to_s
    end
  else
    flash[:error] = "Invalid email"
    redirect '/'
  end
end

get '/logout' do
  # kill session
  session[:user_id] = nil
  redirect '/'
end

post '/logout' do
  # kill session
  session[:user_id] = nil
  redirect '/'
end
