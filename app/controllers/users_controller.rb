# C- CREATE
post '/users' do
	@user = User.new(params[:user])
	if @user.save
		redirect "/users/#{@user.id}"
	else
		@messages = @user.errors.full_messages.join(", ")
		erb :"static/index"
	end
end

#R - SHOW USER DASHBOARD
get '/users/:id' do
	@user = User.find(params[:id])
	@question_all = Question.all
	erb :"users/show"
end

#R - SHOW USER PROFILE
get '/users/:id/profile' do
	@user = User.find(params[:id])
	# @question = Question.find(params[:id])
	erb :"users/profile"
end

#U - UPDATE USER PROFILE
