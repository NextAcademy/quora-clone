get '/' do
	if logged_in?
  		erb :"static/index"
  	else
  		redirect '/login'
  	end
end