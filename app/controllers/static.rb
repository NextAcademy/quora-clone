get '/' do
  if logged_in?
    redirect '/home'
  else
    erb :"/static/index"
  end
end

get '/home' do
  if logged_in?
    erb :'/static/home'
  else
    redirect '/'
  end
end



get '/abc' do
  session[:id] = rand(1..1000)
  redirect '/def'
end

get '/def' do
  "Hello #{session[:id]}"
end
