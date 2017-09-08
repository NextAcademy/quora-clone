get '/' do
  @users = User.all
  if logged_in?
    erb :"static/home"
  else
    erb :"static/index"
  end
end

get '/users/:id' do
  erb :"static/user_profile"
end
