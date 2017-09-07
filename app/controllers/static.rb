get '/' do
  session = nil
  erb :"static/landing"
end

get '/index' do
  erb :"static/index"
end


