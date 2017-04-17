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
   user = User.new(params[:user])

  if user.save
    redirect "users/#{user.id}"
  else
    erb :"static/signup"
  end
end

get '/users/:id' do
  # some code here
  @user = User.find_by_id(params[:id])
  erb :"users/profile"
end

get '/login' do
  erb :"static/login"
end

post '/login' do
 user = User.find_by_email(params[:user][:email])
  if !user.nil? && user.try(:authenticate, params[:user][:password])
    # "SUCCESS"
    session["user"] = user.id
    redirect "users/#{user.id}"
  else
    erb :"static/login"
  end
end

# get '/logout' do
#   session.delete("user")
#   redirect '/'
# end

# post '/logout' do
#   # kill a session when a user chooses to logout, for example, assign nil to a session
#   # redirect to the appropriate page
# end
