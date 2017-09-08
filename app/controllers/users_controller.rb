post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    erb :"static/home"
  else
    @users = User.all
    @errors = user.errors.messages
    erb :"static/index"
  end
end

get '/users/:id' do
  erb :"static/user_profile"
end
