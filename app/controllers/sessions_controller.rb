post '/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    session[:notice] = "success"
    redirect "/users/#{session[:user_id]}"
  else
    # if url == '/login'
    #   redirect = '/login-failure'
    # elsif url == '/login-failure'
    #   x = {message: "Nope"}
    #   x.to_json
    # end
    redirect "static/login-failure"
  end
end



get '/sign_out'do
  session[:user_id] = nil
  redirect "/"
end
