enable :sessions

get '/' do
  if logged_in?
    redirect "/users/#{session[:user_id]}"
  else
    erb :"static/homepage"
  end
end

get '/login-failure' do
  erb :"static/loginfailure"
end

# get '/signup-failure' do
#
# end
#
