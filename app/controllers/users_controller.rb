#CREATE - NEW ACCOUNT
post '/users' do
	#byebug
	@user = User.new(params[:user]) #"[:user]" covers all data under "user[]" in index.erb
		if @user.save
			session[:user_id] = @user.id # to make it so that it logs user in on sign up
			redirect "/users/#{@user.id}"
		else
			@error = @user.errors.full_messages.join(" or ")
			erb :"static/index"
		end

end

#READ - USER INFO
get '/users/:id' do
	erb :"users/home"
end

# get '/homepage' do
# 	@user = User.find(params[:id])
# 	erb :"users/home"
# end

get '/users/:id/profile' do
	@user = User.find(params[:id])
	erb :"users/profile"
end