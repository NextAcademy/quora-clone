get '/' do
  erb :"static/mainpage"
end

get '/users/new' do 
	@all = User.all
	erb :"static/users/new"
end  

post '/users' do 
	@new_user_signup = User.new(params[:user])
	if @new_user_signup.save
		redirect "/"
	else
		@errors = @new_user_signup.errors.messages
		erb :'static/users/new'
	end
end 

get '/signedin' do 
	erb :"static/userloggedin"
end
