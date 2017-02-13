get '/' do
  erb :"static/index"
end


get '/dashboard' do
	erb :'static/dashboard'
end
