get '/' do
  erb :"/static/index"
end

get '/home' do
  erb :'/static/home'
end

get '/abc' do
  session[:id] = rand(1..1000)
  redirect '/def'
end

get '/def' do
  "Hello #{session[:id]}"
end
