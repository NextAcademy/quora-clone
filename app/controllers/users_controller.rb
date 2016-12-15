require 'sinatra/flash'
require 'byebug'
require 'bcrypt'


get '/main' do
  erb :"user/main"
end

post '/main' do
  user = User.new(params[:user])
  if user.save
    redirect '/'
  else
    user.errors.full_messages.each do |msg|
      flash[:register] = msg + " /n"
    end
  end
end

post '/login' do
  user = User.find_by(username: params[:user]["username"])
  if user.authenticate(params[:user]["password"])
    puts "logged in"
    redirect '/main'
  else
    flash[:login] = user.errors.full_messages
  end
end
