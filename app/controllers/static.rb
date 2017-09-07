require 'byebug'

get '/' do
  erb :"static/index"
end

post '/signup' do
	# feature specific to Rails/Sinatra
	# when the form input name is in the format of name="user[attr]"
	# we can use User.new(params[:user])
	# form value is automatically transformed into a hash
	user = User.new(params[:user])
	if user.save
		# codes
	else
		# codes
	end
end
