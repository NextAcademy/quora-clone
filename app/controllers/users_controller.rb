get '/signup' do
  erb :"static/index"
end


post '/signup' do
  user = User.new(params[:user])
  if user.save
    "<h1>user has been created.</h2>"
    else
    "<h2> There is an error </h2>"
    @err_email = "Email: " + user.errors[:email].join(",")
    @err_pass = "Password: " + user.errors[:password].join(",")

    erb :"static/index"
  end
end  

post '/login' do
  # apply a authentication method to check if a user has entered a valid email and password
  # if a user has successfully been authenticated, you can assign the current user id to a session
end

post '/logout' do
  # kill a session when a user chooses to logout, for example, assign nil to a session
  # redirect to the appropriate page
end