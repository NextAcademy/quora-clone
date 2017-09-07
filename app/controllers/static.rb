get '/' do
	if logged_in?
  		erb :"static/user_index"
  	else
  		erb :"static/index"
  	end
end