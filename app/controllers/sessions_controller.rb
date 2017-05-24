
# new
get '/login' do
  erb :"users/login"
end
# create
post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    erb :'users/loginfail'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
