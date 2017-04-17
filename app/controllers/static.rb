get '/' do
  erb :"static/index"
end

get '/signup' do
	erb :"static/sign_up"
end

get '/login' do
	erb :"static/login"
end