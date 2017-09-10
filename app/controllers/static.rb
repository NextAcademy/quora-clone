require 'byebug'
require_relative '../helpers/user'



get '/' do

	if logged_in?

		erb :"static/session"

	else

  		erb :"static/index"

  	end

end

post '/signup' do

	@new_user = User.new(params[:user])

		if @new_user.save

			redirect '/'

		else
				
				@error = "Signup failed"

		end

end

post '/login' do

	@login = User.authenticate(params[:user])

		case @login

			when "email_invalid" 

				@error = "Invalid email address entered"
				erb :"static/index"

			when "password_invalid"

				@error = "Invalid password entered"
				erb :"static/index"

			else

				session[:user_id] = @login
				erb :"static/session"


	end

end

get '/login' do


	if logged_in?

		redirect '/home'

	else

		erb :"static/index"

	end

end	

get '/home' do

	@error = "You're logged in, but I haven't got a page right now"

end

