get '/session' do
  
  erb :"static/session"

end

get '/session/ask_question' do
  
  erb :"static/question"

end

delete '/session/logout' do

	session[:user_id] = nil
	session.clear	
	true
	erb :"static/index"

end
