get '/' do
  erb :"static/index"
end

get '/signup' do
  erb :static/signup
end

get '/login' do
  erb :"static/login"
end
