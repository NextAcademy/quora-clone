get '/' do
	erb :"static/index"
end

#create new user
post '/signup' do
	@new_user = User.new(params[:user])

	if @new_user.save
		@status_message = "New account created successfully"
		redirect "/users/#{@new_user.id}"
	else
		@status_message = @new_user.errors.full_messages
		erb :"static/index"
	end
end


# READ- show

get "/users/:id" do 
	@user = User.find(params[:id])

	erb :"users/show"


end

post "/login" do 

end

post "/logout" do 
	
end
