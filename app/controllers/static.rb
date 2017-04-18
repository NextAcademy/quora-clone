#require 'byebug'

get '/' do
  erb :"static/index"
end

post '/singnup' do
	user = User.new(params[:user])
	if user.save	
		puts "saved"
	else
		puts "error"
	end
end

post '/login' do

	user_db = User.find_by_email(params[:user][:email])

	if !user_db.nil?
		#byebug
		if user_db.password == params[:user][:password]
			puts "authentication success"
			session[:user_id] = user_db.id

			redirect "/users/#{user_db.id}"
		else
			puts "authentication failure"
			#@eror_msg = "authentication failure"
		end
	end
end

get '/logout' do
	session[:user_id] = nil
	redirect "/"
end

get '/users/:user_id' do
	erb :"users/index"
end
