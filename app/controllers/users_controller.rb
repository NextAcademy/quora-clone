post '/signup' do
  user = User.new(params[:user])
  if user.save
    erb :"static/home"
  else
    @users = User.all
    @errors = user.errors.messages
    erb :"static/index"
  end
end
