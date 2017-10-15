#CREATE - ACCOUNT
post '/users' do
	#byebug
	@user = User.new(params[:user]) #"[:user]" covers all data under "user[]" in index.erb
		if @user.save
			redirect "/users/#{@user.id}"
		else
			@error = @user.errors.full_messages.join(" or ")
			erb :"static/index"
		end


end

#READ - USER INFO
get '/users/:id' do
	@user = User.find(params[:id])
	erb :"users/profile"

end