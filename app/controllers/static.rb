get '/' do
  erb :"static/index"
end

get '/failure' do
  erb :"static/failure"
end

get '/login' do
  erb :"users/login"
end

get '/dashboard' do
  erb :"dashboard/index"
end

# get 'users/:id' do
#   erb :""
# end
