post '/users' do
	@user = User.new(params[:user])
	@user.save
	redirect '/'
end

get '/users/:id' do
  if (current_user.id == (params[:id]).to_i)
  	erb :"static/user_profile"
  else
  	redirect '/'
  end
end