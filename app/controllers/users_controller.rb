# In users_controller.rb
post '/signup' do
	p params
	#params was automatically created into a hash
  user = User.new(params[:user])
  p user
  if user.save
    # what should happen if the user is saved?
    p "Success!"
  else
    # what should happen if the user keyed in invalid date?
    @err = user.errors.full_messages
    erb :"static/index"
    # require 'byebug'
    # byebug
  end
end  

# post '/login' do