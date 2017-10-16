post '/signup' do
  user = User.new(params[:user])
  if user.save
    # what should happen if the user is saved?
    redirect "/home"
  else
    # what should happen if the user keyed in invalid date?
    # redirect '/'
    @email_message = user.errors.full_messages.join(',')
    erb :"/static/index"
  end
end

post '/login' do
  # find user with email
  # check password
  # session[:user_id] = user.id
  params.inspect
  user = User.find_by(email: params[:user][:email])
    if user.nil?
      @login_email_message = "Email format incorrect"
      erb :"/static/index"
    elsif user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect "/home"
    else
      @password_message = "wrong password"
      erb :"/static/index"
    end
  # apply an authentication method to check if a user has enter a valid email and password
  # if a user has successfully been authenticated, you can assign the current user id to a session.
end

get '/logout' do
  # kill a session when a user chooses to logout, for example, assign nil to a session.
  session[:user_id] = nil
  # redirect to the appropriate page
  redirect '/'
end

get '/users/:id' do
  # @user = User.find(params[:id])
  erb :"/static/profile"
end
