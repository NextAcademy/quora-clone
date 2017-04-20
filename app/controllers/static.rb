get '/' do
	# byebug
  # p session[:id]
	# @user = User.find(session[:id])
	puts "[LOG] Getting /"
  puts "[LOG] Params: #{params.inspect}"

  if !logged_in? 
		redirect "/login"
	else
		@questions = Question.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
		erb :"static/index"
	end
end