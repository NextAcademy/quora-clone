# In users_controller.rb
post '/signup' do
  user = User.new(params[:user])
  if user.save
    # what should happen if the user is saved?
    redirect '/'
  else
  	@error_messages = user.errors.full_messages
		erb :'static/sign_up'    						 # MIGHT WORK WITH 'REDIRECT'. SHOULD TRY OUT WHEN THIS WORKS!

  end
end  