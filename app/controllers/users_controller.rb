require 'sinatra/flash'
require 'byebug'
require 'bcrypt'

enable :sessions

get '/main' do
  erb :"user/main"
end

get '/' do
  if logged_in? 
    erb :"user/main"
  else
    erb :"static/home"
  end
end

get '/profile' do
  erb :"user/profile"
end 

get '/register' do
  erb :"static/register"
end

get '/login' do
  erb :"static/login"
end


post '/register' do
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
    session[:current_user_id] = user.id
    byebug
    redirect '/main'
  else
    flash[:login] = user.errors.full_messages
  end
end

get '/logout' do
  session.clear 
end
