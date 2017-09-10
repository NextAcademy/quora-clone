# enable :sessions

get '/signup' do
  erb :'/users/new'
end

post '/signup' do
  user = User.new(params[:user])

  if user.save
    session[:user_id] = user.id
    redirect '/dashboard'
  else
    redirect 'failure'
  end
end

get '/login' do
  erb :'/users/login'
end

post '/login' do
  user = User.find_by_email(params[:user][:email])
  #byebug
  if user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect '/dashboard'
  else
    redirect '/failure'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
