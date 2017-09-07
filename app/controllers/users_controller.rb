post '/signup' do
  user = User.new(params[:user])
  if user.save
    # what should happen if the user is saved?
    p "Hello World"
  else
    @users = User.all
    @errors = user.errors.messages
    erb :"static/index"
  end
end
