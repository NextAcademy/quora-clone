get '/' do
	# byebug
  # p session[:id]
	# @user = User.find(session[:id])
	puts "[LOG] Getting /"
  puts "[LOG] Params: #{params.inspect}"

  if !logged_in? 
		redirect "/login"
	else
		erb :"static/index"
	end
end