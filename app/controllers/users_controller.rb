#CREATE ACCOUNT
post '/users' do
	#byebug
	@user = User.new(params[:user]) #"[:user]" covers all data under "user[]" in index.erb
		if @user.save
			redirect "/users/#{@user.id}"
		else
			@error = @url.errors.full_messages.join(" or ")
			return @error.to_json
		end


end

#READ
get '/users/:id' do
	@user = User.find(params[:id])
	erb :"users/profile"

end