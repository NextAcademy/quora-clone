post '/sessions' do
  # Earlier we were authenticating here, now we have moved this to the model
  # user = User.find_by(email:params[:user][:email])
  # if user && user.authenticate(params[:user][:password])
  user = User.authenticate(params)
  if user
    session[:user_id] = user.id
    erb :"static/home"
  else
    redirect "/"
  end
end

delete '/sessions' do
  session[:user_id] = nil
  redirect "/"
end
