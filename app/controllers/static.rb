get '/' do
  erb :"static/home"
end

get '/register' do
  erb :"static/register"
end 

get '/login' do 
  erb :"static/login"
end 