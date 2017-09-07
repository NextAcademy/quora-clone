get '/' do
  @users = User.all
  erb :"static/index"
end
