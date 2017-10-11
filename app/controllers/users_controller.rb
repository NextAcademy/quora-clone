post '/signup' do

	@user = User.new(params[:user])

	if @user.save
		@messages = "welcom!qqquora!"
		erb :"static/new"

	else 
		@messages = @user.errors.full_messages.join(", ")
		erb :"static/index"
	end



end

