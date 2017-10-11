require "bcrypt"


get '/' do
  erb :"static/index"
end


post '/sign_up' do

	# Password = (params['pswrd'])
	# hashed_password = BCrypt::Password.create "encrypted_password"

	@user = User.new(params[:user])
		# username: params['usrname'], email: params['e-mail'], password: encrypted_password)
	if @user.save
		redirect '/'
	else
		puts "You can't do that you doughnut"
	end
end

post '/sendto_signup' do
	erb :"static/signup"
end

post '/sendto_login' do
	erb :"static/login"
end