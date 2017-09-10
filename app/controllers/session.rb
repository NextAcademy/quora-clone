get '/session' do
  
  erb :"static/session"

end

delete '/session/logout' do

	session[:user_id] = nil
	session.clear	
	true
	erb :"static/index"

end
