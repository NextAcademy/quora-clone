get '/' do
  erb :"static/index"
end

post '/signup' do
	user = User.new(params[:user])
	if user.save
		puts "saved"
		redirect "/"
	else
		puts "error"
	end
end

post '/login' do

	user_db = User.find_by_email(params[:user][:email])

	if user_db.password == params[:user][:password]
		puts "authentication success"
	else
		puts "authentication failure"
	end

end







