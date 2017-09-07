require 'byebug'

get '/' do
  erb :"static/index"
end

# create
post '/signup' do
	# feature specific to Rails/Sinatra
	# when the form input name is in the format of name="user[attr]"
	# we can use User.new(params[:user])
	# form value is automatically transformed into a hash
	user = User.new(params[:user])
	if user.save
		redirect "/"
	else
		@errors = user.errors.messages
		erb :"static/index"
	end
end

post '/login' do
	# apply authentication method
	if # success
		# assign current user id to a session
	else
		# error message
	end
end

post '/logout' do
	# kill a session
	# redirect to login page
end
