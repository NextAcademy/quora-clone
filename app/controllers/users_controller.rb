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


#R- SHOW
get '/users/:id' do
	@user = User.find(params[:id])
	erb :"users/show"
end
