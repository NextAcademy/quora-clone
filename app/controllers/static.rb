enable :sessions

get '/' do
  # puts "THIS:"
  # puts session["user"]
  # puts current_user
  erb :"static/index"
end

get '/signup' do
  erb :"static/signup"
end

post '/signup' do
   @user = User.new(params[:user])

  if user.save
    # what should happen if the user is saved?
    p "<h1>Account successfully created!</h1><a href='../login'>login</a>"
    redirect '/'
  else
    # what should happen if the user keyed in invalid date?
    p "Error"
    erb :"static/index"
  end
end  

get '/login' do
  erb :"static/login"
end

post '/login' do
  # apply a authentication method to check if a user has entered a valid email and password
  # if a user has successfully been authenticated, you can assign the current user id to a session
end

get '/logout' do
  session.delete("user")
  redirect to("/")
end

post '/logout' do
  # kill a session when a user chooses to logout, for example, assign nil to a session
  # redirect to the appropriate page
end
