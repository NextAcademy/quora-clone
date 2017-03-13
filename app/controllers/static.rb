enable :sessions

get '/' do
  if logged_in?
    redirect "/users/#{session[:user_id]}"
  else
    erb :"static/homepage"
  end
end

post '/signup' do
  # byebug
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{session[:user_id]}"
  else
    redirect '/signup-failure'
  end
end

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
    redirect "/login-failure"
  end
end

post '/logout' do
  # kill a session when a user chooses to logout, for example, assign nil to a session
  # redirect to the appropriate page
end

get '/sign_out'do
  session[:user_id] = nil
  redirect "/"
end

get '/users/:id' do
  erb :"static/userdashboard"
end

get '/users/:id/edit'do

end
#
# get '/signup-failure' do
#
# end
#
get '/login-failure' do
  erb :"static/loginfailure"
end
