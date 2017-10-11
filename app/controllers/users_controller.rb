
#CREATE
post '/users' do
	#byebug
	@user = User.new(params[:user]) #"[:user]" covers all data under "user[]" in index.erb
		if @user.save

		else

		end


end

#READ